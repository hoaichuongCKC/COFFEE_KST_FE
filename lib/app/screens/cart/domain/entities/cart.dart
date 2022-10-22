// To parse this JSON data, do
//
//     final cartEntity = cartEntityFromJson(jsonString);

import 'package:equatable/equatable.dart';

// class CartEntity extends Equatable {
//   const CartEntity({
//     required this.id,
//     required this.productId,
//     required this.quantity,
//     required this.sizeName,
//     required this.price,
//     required this.productInfor,
//   });

//   final int id;
//   final int productId;
//   final int quantity;
//   final String sizeName;
//   final int price;
//   final ProductInforEntity productInfor;

//  override
//   List<Object?> get props => [id, productId, quantity, price, productInfor];
// }

// class ProductInforEntity extends Equatable {
//   const ProductInforEntity({
//     required this.imageUrl,
//     required this.id,
//     required this.name,
//     required this.categName,
//     required this.listToppings,
//   });
//   final int id;
//   final String imageUrl;
//   final String name;
//   final String categName;
//   final List<ToppingCartEntity> listToppings;
//  override
//   List<Object?> get props => [id, name, imageUrl, categName, listToppings];
// }

// class ToppingCartEntity extends Equatable {
//   const ToppingCartEntity({
//     required this.imageUrl,
//     required this.price,
//     required this.name,
//     required this.unit,
//     required this.quantity,
//   });

//   final int price;
//   final String imageUrl;
//   final String name;
//   final String unit;
//   final int quantity;
//  override
//   List<Object?> get props => [price, name, imageUrl, unit, quantity];
// }
// To parse this JSON data, do
//
//     final cartEntity = cartEntityFromJson(jsonString);

// List<CartEntity> cartEntityFromJson(String str) =>
//     List<CartEntity>.from(json.decode(str).map((x) => CartEntity.fromJson(x)));

// String cartEntityToJson(List<CartEntity> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartEntity extends Equatable {
  const CartEntity({
    required this.id,
    required this.productId,
    required this.imageUrl,
    required this.name,
    required this.categName,
    required this.listTopping,
    required this.sizeName,
    required this.price,
    required this.quantity,
  });

  final int id;
  final int productId;
  final String imageUrl;
  final String name;
  final String categName;
  final String sizeName;
  final String price;
  final int quantity;
  final List<ListToppingEntity> listTopping;
  @override
  List<Object?> get props => [
        id,
        productId,
        imageUrl,
        name,
        categName,
        listTopping,
        quantity,
        price,
        sizeName
      ];

  // @override
  // String toString() =>
  //     'name: $name, price: $price, quantity: $quantity, imageUrl: $imageUrl, unit: $unit';
}

class ListToppingEntity extends Equatable {
  const ListToppingEntity({
    required this.name,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.quantity,
  });

  final String name;
  final int price;
  final String unit;
  final String imageUrl;
  final int quantity;

  @override
  List<Object?> get props => [price, name, imageUrl, unit, quantity];

  @override
  String toString() =>
      'name: $name, price: $price, quantity: $quantity, imageUrl: $imageUrl, unit: $unit';
  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "unit": unit,
        "image_url": imageUrl,
        "quantity": quantity,
      };
}
