// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.id,
    required super.productId,
    required super.imageUrl,
    required super.name,
    required super.categName,
    required super.price,
    required super.quantity,
    required super.sizeName,
    required super.listTopping,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        productId: json["product_id"],
        imageUrl: json["image_url"],
        name: json["name"],
        categName: json["categ_name"],
        listTopping: List<ListToppingModel>.from(
            json["list_topping"].map((x) => ListToppingModel.fromJson(x))),
        price: json["price"],
        sizeName: json["size_name"],
        quantity: json["quantity"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image_url": imageUrl,
        "name": name,
        "categ_name": categName,
        "price": price,
        "size_name": sizeName,
        "quantity": quantity,
        "list_topping": List<dynamic>.from(listTopping.map((x) => x.toJson())),
      };
  static List<CartModel> cartModelFromJson(String str) =>
      List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

  static String cartModelToJson(List<CartModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  @override
  String toString() => toJson().toString();
}

class ListToppingModel extends ToppingEntity {
  ListToppingModel(
      {required super.name,
      required super.id,
      required super.price,
      required super.unit,
      required super.imageUrl,
      required super.quantity});

  factory ListToppingModel.fromJson(Map<String, dynamic> json) =>
      ListToppingModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        unit: json["unit"],
        imageUrl: json["image_url"],
        quantity: json["quantity"],
      );
}
