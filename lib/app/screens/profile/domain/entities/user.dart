import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.userId,
    required this.phone,
    required this.fullname,
    required this.fullAddress,
    required this.gender,
    required this.avatarUrl,
  });
  final int userId;
  final String phone;
  final String fullname;
  final String fullAddress;
  final String gender;
  final dynamic avatarUrl;
  @override
  List<Object?> get props =>
      [userId, phone, fullAddress, fullname, gender, avatarUrl];
}
