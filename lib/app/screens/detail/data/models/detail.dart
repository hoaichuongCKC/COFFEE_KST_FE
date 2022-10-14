import 'dart:convert';

import 'package:coffee_kst/app/screens/detail/data/models/review.dart';
import 'package:coffee_kst/app/screens/detail/data/models/topping.dart';
import 'package:coffee_kst/app/screens/detail/domain/entities/detail.dart';

class DetailModel extends DetailEntity {
  const DetailModel(
      {required super.id,
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
      required super.reviews,
      required super.toppings});

  static DetailModel detailModelFromJson(String str) =>
      DetailModel.fromJson(json.decode(str));

  String detailModelToJson(DetailModel data) => json.encode(data.toJson());

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
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
        reviews: List<ReviewModel>.from(
            json["reviews"].map((x) => ReviewModel.fromJson(x))),
        toppings: List<ToppingModel>.from(
            json["toppings"].map((x) => ToppingModel.fromJson(x))),
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
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "toppings": List<dynamic>.from(toppings.map((x) => x.toJson())),
      };
}
