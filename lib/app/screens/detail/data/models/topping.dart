import 'package:coffee_kst/app/screens/detail/domain/entities/topping.dart';

class ToppingModel extends ToppingEntity {
  const ToppingModel(
      {required super.id,
      required super.name,
      required super.price,
      required super.imageUrl,
      required super.unit});
  factory ToppingModel.fromJson(Map<String, dynamic> json) => ToppingModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        imageUrl: json["image_url"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image_url": imageUrl,
        "unit": unit,
      };
  @override
  String toString() => toJson().toString();
}
