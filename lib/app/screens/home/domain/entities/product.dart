// To parse this JSON data, do
//
//     final productEnity = productEnityFromJson(jsonString);

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.size1,
    required this.size2,
    required this.size3,
    required this.price1,
    required this.price2,
    required this.price3,
    required this.unit,
    required this.imageUrl,
    required this.categName,
    required this.countRating,
  });

  final int id;
  final String name;
  final String description;
  final dynamic size1;
  final dynamic size2;
  final dynamic size3;
  final dynamic price1;
  final dynamic price2;
  final dynamic price3;
  final String unit;
  final String imageUrl;
  final String categName;
  final dynamic countRating;
  @override
  List<Object?> get props => [
        id,
        name,
        description,
        size1,
        size2,
        size3,
        price1,
        price2,
        price3,
        unit,
        imageUrl,
        categName,countRating
      ];
}
