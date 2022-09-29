import 'dart:convert';

import 'package:coffee_kst/app/screens/home/domain/entities/voucher.dart';
import 'package:easy_localization/easy_localization.dart';

class VoucherModel extends VoucherEntity {
  const VoucherModel(
      {required super.id,
      required super.productId,
      required super.title,
      required super.description,
      required super.discount,
      required super.endDate,
      required super.limit,
      required super.condition,
      required super.imageUrl,
      required super.status,
      required super.createdAt,
      required super.updatedAt});
  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["id"],
        productId: json["product_id"],
        title: json["title"],
        description: json["description"],
        discount: json["discount"],
        endDate:
            DateFormat("dd-MM-yyyy").format(DateTime.parse(json["end_date"])),
        limit: json["limit"],
        condition: json["condition"],
        imageUrl: json["image_url"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "title": title,
        "description": description,
        "discount": discount,
        "end_date": endDate,
        "limit": limit,
        "condition": condition,
        "image_url": imageUrl,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
  static List<VoucherModel> voucherModelFromJson(String str) =>
      List<VoucherModel>.from(
        json.decode(str).map((x) => VoucherModel.fromJson(x)),
      );
  @override
  String toString() => toJson().toString();
}
