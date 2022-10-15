import 'dart:convert';

import 'package:coffee_kst/app/screens/home/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.size1,
    required super.size2,
    required super.size3,
    required super.price1,
    required super.price2,
    required super.price3,
    required super.unit,
    required super.imageUrl,
    required super.categName,
    required super.countRating,
  });
  static List<ProductModel> productEnityFromJson(String str) =>
      List<ProductModel>.from(
          json.decode(str).map((x) => ProductModel.fromJson(x)));
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        size1: json["size1"],
        size2: json["size2"],
        size3: json["size3"],
        price1: json["price1"],
        price2: json["price2"],
        price3: json["price3"],
        unit: json["unit"],
        imageUrl: json["image_url"],
        categName: json["categ_name"],
        countRating: json["count_rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "size1": size1,
        "size2": size2,
        "size3": size3,
        "price1": price1,
        "price2": price2,
        "price3": price3,
        "unit": unit,
        "image_url": imageUrl,
        "categ_name": categName,
        "count_rating": countRating,
      };
  @override
  String toString() => toJson().toString();
}
