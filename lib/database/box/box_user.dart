// ignore_for_file: constant_identifier_names

import 'package:coffee_kst/database/hive/user.dart';
import 'package:hive/hive.dart';

//name box
const String NAME_BOX_USER = "user_hive";

//key name
const String KEY_BOX = 'user_storage';

class BoxesUser {
  static BoxesUser instance = BoxesUser();

  static Future<Box<UserHive>> openBoxUser() async =>
      await Hive.openBox<UserHive>(NAME_BOX_USER);

  //save token and freshtoken of user
  void setUser(Map<String, dynamic> data) async {
    var box = await BoxesUser.openBoxUser();
    box.put(
      KEY_BOX,
      UserHive(
        token: data['token'],
        refreshToken: data['refresh_token'],
      ),
    );
  }

  //get token
  Future<String> getDataTokenUser() async {
    var box = await BoxesUser.openBoxUser();

    var token = !box.keys.contains(KEY_BOX) ? '' : box.get(KEY_BOX)!.token;
    return token;
  }

  //delete data
  Future deleteTokenUser() async {
    var box = await BoxesUser.openBoxUser();
    await box.delete(KEY_BOX);
  }
}
