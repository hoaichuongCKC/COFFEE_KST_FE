import 'package:equatable/equatable.dart';

class VoucherEntity extends Equatable {
  const VoucherEntity({
    required this.id,
    required this.productId,
    required this.title,
    required this.description,
    required this.discount,
    required this.endDate,
    required this.limit,
    required this.condition,
    required this.imageUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final dynamic productId;
  final String title;
  final String description;
  final int discount;
  final String endDate;
  final int limit;
  final int condition;
  final dynamic imageUrl;
  final int status;
  final dynamic createdAt;
  final dynamic updatedAt;

  @override
  List<Object?> get props => [
        id,
        productId,
        title,
        description,
        discount,
        endDate,
        limit,
        condition,
        imageUrl,
        status,
        createdAt,
        updatedAt
      ];
}
