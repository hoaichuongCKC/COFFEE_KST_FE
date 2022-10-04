import 'package:coffee_kst/app/screens/detail/data/models/review.dart';
import 'package:coffee_kst/app/screens/detail/data/models/topping.dart';
import 'package:equatable/equatable.dart';

class DetailEnity extends Equatable {
  const DetailEnity({
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
    required this.reviews,
    required this.toppings,
  });

  final int id;
  final String name;
  final String description;
  final String size1;
  final String size2;
  final String size3;
  final int price1;
  final dynamic price2;
  final dynamic price3;
  final String unit;
  final String imageUrl;
  final String categName;
  final List<ReviewModel> reviews;
  final List<ToppingModel> toppings;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        size1,
        size2,
        size3,
        price3,
        price1,
        price2,
        unit,
        imageUrl,
        reviews,
        toppings
      ];
}
