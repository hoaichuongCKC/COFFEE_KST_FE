import 'package:hive/hive.dart';

part 'language.g.dart';

@HiveType(typeId: 2)
class LanguageHive {
  LanguageHive({
    required this.isLanguageVietNamese,
  });

  @HiveField(0)
  late bool isLanguageVietNamese;

  @override
  String toString() {
    return 'isDarkTheme: $isLanguageVietNamese';
  }
}
