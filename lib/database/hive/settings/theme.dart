import 'package:hive/hive.dart';

part 'theme.g.dart';

@HiveType(typeId: 1)
class ThemeHive {
  ThemeHive({
    required this.isDarkTheme,
  });

  @HiveField(0)
  late bool isDarkTheme;

  @override
  String toString() {
    return 'isDarkTheme: $isDarkTheme';
  }
}
