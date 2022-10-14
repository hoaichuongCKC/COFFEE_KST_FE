// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'product_detail_bloc.dart';

class ToppingParams extends Equatable {
  final int id;
  int quantity;
  final int price;
  ToppingParams({
    required this.id,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        "topping_id": id,
        "quantity": quantity,
      };
  @override
  List<Object?> get props => [id, quantity, price];
  @override
  String toString() => 'Topping(id: $id, quantity: $quantity)';
}

class ProductDetailServiceState extends Equatable {
  final DetailState state;
  final int total;
  final int defautlPrice;
  final int productId;
  final int quantity;
  final String sizeName;
  final String message;
  final int price;
  final List<ToppingParams> listTopping;
  final DetailEntity data;
  final CodeState codeState;
  const ProductDetailServiceState({
    this.state = const ProductDetailInitial(),
    this.total = 0,
    this.listTopping = const <ToppingParams>[],
    this.defautlPrice = 0,
    this.productId = 0,
    this.quantity = 1,
    this.sizeName = '',
    this.message = '',
    this.price = 0,
    this.codeState = const InititalCode(),
    this.data = const DetailEntity(
        id: 0,
        name: '',
        description: '',
        size1: '',
        size2: '',
        size3: '',
        price1: 0,
        price2: 0,
        price3: 0,
        unit: '',
        imageUrl: '',
        categName: '',
        reviews: [],
        toppings: []),
  });

  @override
  List<Object> get props => [
        total,
        defautlPrice,
        productId,
        quantity,
        listTopping,
        sizeName,
        state,
        data,
        message
      ];

  ProductDetailServiceState copyWith({
    DetailState? state,
    int? total,
    int? defautlPrice,
    int? productId,
    int? quantity,
    CodeState? codeState,
    List<ToppingParams>? listTopping,
    String? sizeName,
    String? message,
    DetailEntity? data,
    int? price,
  }) {
    return ProductDetailServiceState(
      state: state ?? this.state,
      total: total ?? this.total,
      defautlPrice: defautlPrice ?? this.defautlPrice,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      sizeName: sizeName ?? this.sizeName,
      data: data ?? this.data,
      message: message ?? this.message,
      listTopping: listTopping ?? this.listTopping,
      price: price ?? this.price,
      codeState: codeState ?? this.codeState,
    );
  }
}

abstract class DetailState {
  const DetailState();
}

class ProductDetailInitial extends DetailState {
  const ProductDetailInitial();
}

class ProductDetailLoading extends DetailState {}

class ProductDetailLoaded extends DetailState {}

class ProductDetailLoadFailed extends DetailState {}
