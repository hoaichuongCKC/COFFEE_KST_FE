// To parse this JSON data, do
//
//     final cartEntity = cartEntityFromJson(jsonString);

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  CartEntity({
    required this.id,
    required this.invoiceDetailId,
    required this.productId,
    required this.imageUrl,
    required this.name,
    required this.categName,
    required this.listTopping,
    required this.sizeName,
    required this.price,
    required this.quantity,
  });

  int id;
  int invoiceDetailId;
  int productId;
  String imageUrl;
  String name;
  String categName;
  dynamic sizeName;
  String price;
  int quantity;
  List<ToppingEntity> listTopping;
  @override
  List<Object?> get props => [
        id,
        invoiceDetailId,
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

class ToppingEntity extends Equatable {
  ToppingEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.quantity,
  });
  int id;
  String name;
  int price;
  String unit;
  String imageUrl;
  int quantity;

  @override
  List<Object?> get props => [id, price, name, imageUrl, unit, quantity];

  @override
  String toString() =>
      'name: $name, price: $price, quantity: $quantity, imageUrl: $imageUrl, unit: $unit';
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "unit": unit,
        "image_url": imageUrl,
        "quantity": quantity,
      };
}
