import 'package:equatable/equatable.dart';

class ToppingEntity extends Equatable {
  const ToppingEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.unit,
  });

  final int id;
  final String name;
  final int price;
  final String imageUrl;
  final String unit;

  @override
  List<Object?> get props => [id, name, price, imageUrl, unit];
}
