// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final invoiceEntity = invoiceEntityFromJson(jsonString);
import 'package:equatable/equatable.dart';

class InvoiceEntity extends Equatable {
  const InvoiceEntity({
    required this.shippingName,
    required this.shippingPhone,
    required this.shippingAddress,
    required this.isPayment,
    required this.total,
    required this.status,
    required this.createdAt,
    required this.id,
    required this.productInfor,
  });

  final int id;
  final String shippingName;
  final String shippingPhone;
  final String shippingAddress;
  final int isPayment;
  final int total;
  final int status;
  final DateTime createdAt;
  final List<ProductInforEntity> productInfor;

  @override
  List<Object?> get props => [
        shippingAddress,
        shippingName,
        shippingPhone,
        isPayment,
        total,
        status,
        id,
        createdAt,
        productInfor,
      ];
}

class ProductInforEntity extends Equatable {
  final int invoiceDetailsId;
  final String name;
  final String imageUrl;
  final int quantity;
  final String sizeName;
  final String categName;
  final String price;
  final List<ToppingInforEntity> toppingInfor;

  const ProductInforEntity(
      {required this.invoiceDetailsId,
      required this.name,
      required this.categName,
      required this.imageUrl,
      required this.quantity,
      required this.sizeName,
      required this.price,
      required this.toppingInfor});

  factory ProductInforEntity.fromJson(Map<String, dynamic> json) =>
      ProductInforEntity(
        invoiceDetailsId: json["invoice_details_id"],
        name: json["name"],
        imageUrl: json["image_url"],
        quantity: json["quantity"],
        categName: json["categ_name"],
        sizeName: json["size_name"] ?? '',
        price: json["price"],
        toppingInfor: List<ToppingInforEntity>.from(
            json["topping_infor"].map((x) => ToppingInforEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "invoice_details_id": invoiceDetailsId,
        "name": name,
        "image_url": imageUrl,
        "quantity": quantity,
        "size_name": sizeName,
        "categ_name": categName,
        "price": price,
        "topping_infor":
            List<dynamic>.from(toppingInfor.map((x) => x.toJson())),
      };
  @override
  List<Object?> get props => [
        invoiceDetailsId,
        name,
        price,
        sizeName,
        toppingInfor,
        imageUrl,
        categName,
        quantity
      ];
}

class ToppingInforEntity extends Equatable {
  const ToppingInforEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.quantity,
  });

  final int id;
  final String name;
  final int price;
  final String unit;
  final String imageUrl;
  final int quantity;
  factory ToppingInforEntity.fromJson(Map<String, dynamic> json) =>
      ToppingInforEntity(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        unit: json["unit"],
        imageUrl: json["image_url"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "unit": unit,
        "image_url": imageUrl,
        "quantity": quantity,
      };

  @override
  List<Object?> get props => [id, name, price, unit, quantity, imageUrl];
}
