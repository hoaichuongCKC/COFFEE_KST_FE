// To parse this JSON data, do
//
//     final cartEntity = cartEntityFromJson(jsonString);

import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  const CartEntity({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.sizeName,
    required this.price,
    required this.productInfor,
  });

  final int id;
  final int productId;
  final int quantity;
  final String sizeName;
  final int price;
  final ProductInforEntity productInfor;

  @override
  List<Object?> get props => [id, productId, quantity, price, productInfor];
}

class ProductInforEntity extends Equatable {
  const ProductInforEntity({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.categName,
    required this.listToppings,
  });
  final int id;
  final String imageUrl;
  final String name;
  final String categName;
  final List<ToppingCartEntity> listToppings;
  @override
  List<Object?> get props => [id, name, imageUrl, categName, listToppings];
}

class ToppingCartEntity extends Equatable {
  const ToppingCartEntity({
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.unit,
    required this.quantity,
  });

  final int price;
  final String imageUrl;
  final String name;
  final String unit;
  final int quantity;
  @override
  List<Object?> get props => [price, name, imageUrl, unit, quantity];
}
