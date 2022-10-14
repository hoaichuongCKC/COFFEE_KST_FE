import 'dart:convert';

import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';

class CartModel extends CartEntity {
  const CartModel(
      {required super.id,
      required super.productId,
      required super.quantity,
      required super.sizeName,
      required super.price,
      required super.productInfor});
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        sizeName: json["size_name"],
        price: int.parse(json["price"].toString()),
        productInfor: ProductInforModel.fromJson(json["product_infor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "quantity": quantity,
        "size_name": sizeName,
        "price": price,
        "image_url": productInfor,
      };
  static List<CartModel> cartModelFromJson(String str) =>
      List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

  static String cartModelToJson(List<CartModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  @override
  String toString() => toJson().toString();
}

class ProductInforModel extends ProductInforEntity {
  const ProductInforModel(
      {required super.id,
      required super.imageUrl,
      required super.name,
      required super.categName,
      required super.listToppings});
  factory ProductInforModel.fromJson(Map<String, dynamic> json) =>
      ProductInforModel(
        id: json["id"],
        imageUrl: json["image_url"],
        name: json["name"],
        categName: json["categ_name"],
        listToppings: List<ToppingModel>.from(
            json["list_topping"].map((x) => ToppingModel.fromJson(x))),
      );
}

class ToppingModel extends ToppingCartEntity {
  const ToppingModel(
      {required super.imageUrl,
      required super.price,
      required super.quantity,
      required super.name,
      required super.unit});
  factory ToppingModel.fromJson(Map<String, dynamic> json) => ToppingModel(
        price: json["price"],
        imageUrl: json["image_url"],
        quantity: json["quantity"],
        name: json["name"],
        unit: json["unit"],
      );
}
