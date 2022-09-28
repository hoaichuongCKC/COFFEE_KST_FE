// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:equatable/equatable.dart';

class ProductTypeEntity extends Equatable {
  final String categ_name;
  const ProductTypeEntity({
    required this.categ_name,
  });
  @override
  List<Object?> get props => [categ_name];
}
