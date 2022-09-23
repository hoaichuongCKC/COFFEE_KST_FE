// ignore_for_file: constant_identifier_names

import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:hive/hive.dart';

//name box
const String NAME_BOX_INFORMATION = "information_user_hive";

//key name
const String KEY_BOX_INFORMATION = 'information_user_storage';

class BoxesInformationUser {
  static BoxesInformationUser instance = BoxesInformationUser();

  static Future<Box<InformationUserHive>> openBoxUser() async =>
      await Hive.openBox<InformationUserHive>(NAME_BOX_INFORMATION);

  void saveInformationUser(InformationUserHive data) async {
    final box = await openBoxUser();
    box.put(KEY_BOX_INFORMATION, data);
  }

  //delete data
  Future deleteDataUser() async {
    var box = await BoxesInformationUser.openBoxUser();
    await box.delete(KEY_BOX_INFORMATION);
  }
}
