// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AppEntity extends Equatable {
  final int code;
  final String message;
  final List<dynamic> data;
  const AppEntity({
    required this.code,
    required this.message,
    required this.data,
  });
  @override
  List<Object?> get props => [code, message, data];
}

class AppModel extends AppEntity {
  const AppModel(
      {required super.code, required super.message, required super.data});

  factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
        code: json['code'],
        message: json['message'],
        data: json['data'],
      );
  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data,
      };
  @override
  String toString() => toJson().toString();
}
