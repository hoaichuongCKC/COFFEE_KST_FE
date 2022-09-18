import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.phone,
    required super.fullname,
    required super.fullAddress,
    required super.gender,
    required super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        phone: json["phone"],
        fullname: json["fullname"],
        fullAddress: json["full_address"],
        gender: json["gender"],
        avatarUrl: json["avatar_url"],
      );
  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "phone": phone,
        "fullname": fullname,
        "full_address": fullAddress,
        "gender": gender,
        "avatar_url": avatarUrl,
      };

  @override
  String toString() => toJson().toString();
}
