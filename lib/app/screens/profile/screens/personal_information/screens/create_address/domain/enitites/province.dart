// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProvinceEntity extends Equatable {
  final String name;
  final int idProvince;
  const ProvinceEntity({
    required this.name,
    required this.idProvince,
  });
  @override
  List<Object?> get props => [idProvince, name];
}
