// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/product.dart';
import 'package:coffee_kst/app/screens/home/domain/usecase/get_best_seller.dart';
import 'package:coffee_kst/app/screens/home/domain/usecase/get_list_product.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:coffee_kst/core/utils/home.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetListProductUseCase getListProductUseCase;
  final GetBestSellerUseCase getBestSellerUseCase;
  ProductBloc(this.getListProductUseCase, this.getBestSellerUseCase)
      : super(const ProductState()) {
    on<LoadAllProductEvent>(_handleLoadProductList);
    on<LoadCoffeeEvent>(_newIsolateLoadCoffee);
    on<LoadTeaEvent>(_newIsolateLoadTea);
    on<LoadCakeEvent>(_newIsolateLoadCake);
    on<LoadBestSellerEvent>(_onLoadBestSeller);
    on<AddKeyFilterPrice>(_addKeywordFilterPrice);
    on<AddKeyFilterCateg>(_addKeywordFilterCateg);
    on<ChangedSearchEvent>(_searchProduct);
    on<FilterProductEvent>(_filter);
    on<ResetList>(((event, emit) => emit(state.copyWith(
          listSearch: const [],
          filterState: const FilterInitital(),
        ))));
  }
  _onLoadBestSeller(
      LoadBestSellerEvent event, Emitter<ProductState> emit) async {
    try {
      final result = await getBestSellerUseCase.call(NoParams());
      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_NOT_INTERNET,
                state: ProductLoadFailed()));
          } else if (result is ServerFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_SERVER_FAILURE,
                state: ProductLoadFailed()));
          }
        },
        (List<ProductEntity> r) {
          emit(state.copyWith(listBestSeller: r));
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _handleLoadProductList(
      LoadAllProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(state: ProductLoading()));
    try {
      final result = await getListProductUseCase.call(NoParams());
      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_NOT_INTERNET,
                state: ProductLoadFailed()));
          } else if (result is ServerFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_SERVER_FAILURE,
                state: ProductLoadFailed()));
          }
        },
        (List<ProductEntity> r) {
          emit(state.copyWith(state: ProductLoaded(), listAllProduct: r));
          add(LoadCoffeeEvent());
          add(LoadTeaEvent());
          add(LoadCakeEvent());
        },
      );
    } catch (e) {
      emit(state.copyWith(
          messageError: e.toString(), state: ProductLoadFailed()));
    }
  }

  //////////////////////////----------------------------
  void _newIsolateLoadCoffee(
      LoadCoffeeEvent event, Emitter<ProductState> emit) async {
    final results = await compute(_handleLoadCoffee, state.listAllProduct);
    emit(state.copyWith(listCoffee: results));
  }

  static List<ProductEntity> _handleLoadCoffee(List<ProductEntity> param) {
    final List<ProductEntity> list = param;
    final result =
        list.where((element) => element.categName == COFFEE_TYPE).toList();
    return result;
  }

  //////////////////////////----------------------------
  void _newIsolateLoadTea(
      LoadTeaEvent event, Emitter<ProductState> emit) async {
    final results = await compute(_handleLoadTea, state.listAllProduct);
    emit(state.copyWith(listTea: results));
  }

  static List<ProductEntity> _handleLoadTea(List<ProductEntity> param) {
    final List<ProductEntity> list = param;
    final result =
        list.where((element) => element.categName == TEA_TYPE).toList();
    return result;
  }

  //////////////////////////----------------------------
  void _newIsolateLoadCake(
      LoadCakeEvent event, Emitter<ProductState> emit) async {
    final results = await compute(_handleLoadCake, state.listAllProduct);
    emit(state.copyWith(listCake: results));
  }

  static List<ProductEntity> _handleLoadCake(List<ProductEntity> param) {
    final List<ProductEntity> list = param;
    final result =
        list.where((element) => element.categName == CAKE_TYPE).toList();
    return result;
  }

  _addKeywordFilterCateg(AddKeyFilterCateg event, Emitter<ProductState> emit) {
    bool isCheck = false;
    for (String key in List.from(state.keywordNameType)) {
      if (key == event.categ) {
        isCheck = true;
        break;
      }
    }
    if (isCheck) {
      emit(state.copyWith(
          keywordNameType: List.from(state.keywordNameType)
            ..remove(event.categ)));
    } else {
      emit(state.copyWith(
          keywordNameType: List.from(state.keywordNameType)..add(event.categ)));
    }
  }

  _addKeywordFilterPrice(AddKeyFilterPrice event, Emitter<ProductState> emit) {
    String distancePrice = event.price;
    emit(state.copyWith(keywordDistancePrice: distancePrice));
  }

  _searchProduct(ChangedSearchEvent event, Emitter<ProductState> emit) {
    if (event.keyword.isEmpty) {
      emit(state.copyWith(listSearch: [], filterState: const FilterInitital()));
    } else {
      final results = state.listAllProduct
          .where((element) => element.name.contains(event.keyword))
          .toList();
      if (results.isNotEmpty) {
        emit(state.copyWith(listSearch: results, filterState: FilterLoaded()));
      } else {
        emit(state.copyWith(
            listSearch: results, filterState: FilterNotDataEmpty()));
      }
    }
  }

  _filter(FilterProductEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(filterState: FilterLoading()));
    List<ProductEntity> results = [];
    //if params 1 for price
    if (state.keywordDistancePrice.isNotEmpty &&
        state.keywordNameType.isEmpty) {
      if (state.keywordDistancePrice.contains('-')) {
        final newList = state.keywordDistancePrice.split(' - ');
        results = (state.listAllProduct).where((element) {
          return element.price1 >= int.parse(newList[0]) &&
              element.price1 < int.parse(newList[1]);
        }).toList();
      } else {
        results = (state.listAllProduct).where((element) {
          return element.price1 >= int.parse(state.keywordDistancePrice);
        }).toList();
      }
    }

    //if param 1 for type
    else if (state.keywordDistancePrice.isEmpty &&
        state.keywordNameType.isNotEmpty) {
      if (state.keywordNameType.length == 1) {
        results = state.listAllProduct
            .where((element) => element.categName == state.keywordNameType[0])
            .toList();
      } else {
        for (String key in state.keywordNameType) {
          results.addAll(state.listAllProduct
              .where((element) => element.categName == key)
              .toList());
        }
      }
    }

    // if params is two
    else if (state.keywordDistancePrice.isNotEmpty &&
        state.keywordNameType.isNotEmpty) {
      if (state.keywordDistancePrice.contains('-')) {
        final newList = state.keywordDistancePrice.split(' - ');
        if (state.keywordNameType.length == 1) {
          results = state.listAllProduct
              .where((element) => element.categName == state.keywordNameType[0])
              .toList();
          results = results.where((element) {
            return element.price1 >= int.parse(newList[0]) &&
                element.price1 < int.parse(newList[1]);
          }).toList();
        } else {
          for (String key in state.keywordNameType) {
            results.addAll(state.listAllProduct
                .where((element) => element.categName == key)
                .toList());
          }
          results = results.where((element) {
            return element.price1 >= int.parse(newList[0]) &&
                element.price1 < int.parse(newList[1]);
          }).toList();
        }
      } else {
        if (state.keywordNameType.length == 1) {
          results = state.listAllProduct
              .where((element) => element.categName == state.keywordNameType[0])
              .toList();
          results = results.where((element) {
            return element.price1 >= int.parse(state.keywordDistancePrice);
          }).toList();
        } else {
          for (String key in state.keywordNameType) {
            results.addAll(state.listAllProduct
                .where((element) => element.categName == key)
                .toList());
          }
          results = results.where((element) {
            return element.price1 >= int.parse(state.keywordDistancePrice);
          }).toList();
        }
      }
      //list type == 1 && price is one

    }

    if (results.isEmpty) {
      emit(state.copyWith(
          filterState: FilterNotDataEmpty(),
          listSearch: results,
          keywordDistancePrice: '',
          keywordNameType: []));
    } else {
      emit(state.copyWith(
          filterState: FilterLoaded(),
          listSearch: results,
          keywordDistancePrice: '',
          keywordNameType: []));
    }
  }
}
