// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:coffee_kst/app/screens/home/domain/entities/product_type.dart';

List<ProductTypeModel> productTypeModelFromJson(String str) =>
    List<ProductTypeModel>.from(
        json.decode(str).map((x) => ProductTypeModel.fromJson(x)));

class ProductTypeModel extends ProductTypeEntity {
  const ProductTypeModel({required super.categ_name});
  factory ProductTypeModel.fromJson(Map<String, dynamic> json) =>
      ProductTypeModel(
        categ_name: json["categ_name"],
      );

  Map<String, dynamic> toJson() => {
        "categ_name": categ_name,
      };
  @override
  String toString() => toJson().toString();
}
