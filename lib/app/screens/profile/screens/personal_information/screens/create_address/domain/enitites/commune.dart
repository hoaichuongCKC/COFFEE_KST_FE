// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CommuneEntity extends Equatable {
  final String name;
  final String idCommune;
  final String idDistrict;
  const CommuneEntity({
    required this.name,
    required this.idDistrict,
    required this.idCommune,
  });
  @override
  List<Object?> get props => [idDistrict, name, idCommune];
}
