// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.listBestSeller = const [],
    this.messageError = '',
    this.keywordNameType = const [],
    this.keywordDistancePrice = '',
    this.listAllProduct = const [],
    this.listCake = const [],
    this.listCoffee = const [],
    this.listTea = const [],
    this.listSearch = const [],
    this.state = const ProductInitial(),
    this.filterState = const FilterInitital(),
  });
  final String messageError;
  final ProductServiceState state;
  final List<ProductEntity> listAllProduct;
  final List<ProductEntity> listBestSeller;
  final List<ProductEntity> listCoffee;
  final List<ProductEntity> listCake;
  final List<ProductEntity> listTea;
  final List<ProductEntity> listSearch;
  final FilterState filterState;
  final List<String> keywordNameType;
  final String keywordDistancePrice;
  @override
  List<Object> get props => [
        listBestSeller,
        messageError,
        listAllProduct,
        listCake,
        listCoffee,
        listTea,
        listSearch,
        keywordNameType,
        keywordDistancePrice,
        filterState,
      ];

  ProductState copyWith({
    String? messageError,
    ProductServiceState? state,
    List<ProductEntity>? listAllProduct,
    List<ProductEntity>? listBestSeller,
    List<ProductEntity>? listCoffee,
    List<ProductEntity>? listCake,
    List<ProductEntity>? listTea,
    List<ProductEntity>? listSearch,
    FilterState? filterState,
    List<String>? keywordNameType,
    String? keywordDistancePrice,
  }) {
    return ProductState(
      messageError: messageError ?? this.messageError,
      state: state ?? this.state,
      listAllProduct: listAllProduct ?? this.listAllProduct,
      listBestSeller: listBestSeller ?? this.listBestSeller,
      listCoffee: listCoffee ?? this.listCoffee,
      listCake: listCake ?? this.listCake,
      listTea: listTea ?? this.listTea,
      listSearch: listSearch ?? this.listSearch,
      filterState: filterState ?? this.filterState,
      keywordNameType: keywordNameType ?? this.keywordNameType,
      keywordDistancePrice: keywordDistancePrice ?? this.keywordDistancePrice,
    );
  }
}

abstract class ProductServiceState {
  const ProductServiceState();
}

class ProductInitial extends ProductServiceState {
  const ProductInitial();
}

class ProductLoading extends ProductServiceState {}

class ProductLoaded extends ProductServiceState {}

class ProductLoadFailed extends ProductServiceState {}

abstract class FilterState {
  const FilterState();
}

class FilterInitital extends FilterState {
  const FilterInitital();
}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {}

class FilterNotDataEmpty extends FilterState {}
