import 'dart:convert';

import 'package:coffee_kst/app/screens/cart/domain/entities/info_receipt.dart';

class InvoiceModels extends InvoiceEntity {
  const InvoiceModels({
    required super.shippingName,
    required super.shippingPhone,
    required super.shippingAddress,
    required super.isPayment,
    required super.total,
    required super.status,
    required super.createdAt,
    required super.id,
    required super.productInfor,
  });

  static List<InvoiceModels> invoiceEntityFromJson(String str) =>
      List<InvoiceModels>.from(
          json.decode(str).map((x) => InvoiceModels.fromJson(x)));

  factory InvoiceModels.fromJson(Map<String, dynamic> json) => InvoiceModels(
        id: json["id"],
        shippingName: json["shipping_name"],
        shippingPhone: json["shipping_phone"],
        shippingAddress: json["shipping_address"],
        isPayment: json["isPayment"],
        total: json["total"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        productInfor: List<ProductInforEntity>.from(
            json["product_infor"].map((x) => ProductInforEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shipping_name": shippingName,
        "shipping_phone": shippingPhone,
        "shipping_address": shippingAddress,
        "isPayment": isPayment,
        "total": total,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "product_infor":
            List<dynamic>.from(productInfor.map((x) => x.toJson())),
      };
}
