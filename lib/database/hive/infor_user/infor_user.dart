// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'infor_user.g.dart';

@HiveType(typeId: 3)
class InformationUserHive extends Equatable {
  InformationUserHive(this.user_id, this.phone, this.fullname,
      this.full_address, this.gender, this.avatar_url);

  @HiveField(0)
  late int user_id;

  @HiveField(1)
  late String phone;

  @HiveField(2)
  late String fullname;

  @HiveField(3)
  late String full_address;

  @HiveField(4)
  late String gender;

  @HiveField(5)
  late dynamic avatar_url;

  @override
  String toString() {
    return 'user_id: $user_id ,phone : $phone, fullname: $fullname, gender: $gender, full_address: $full_address, avatar: $avatar_url';
  }

  @override
  List<Object?> get props =>
      [user_id, phone, gender, phone, full_address, fullname, avatar_url];
}
