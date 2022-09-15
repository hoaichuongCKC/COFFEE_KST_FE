import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserHive {
  UserHive({
    required this.token,
    required this.refreshToken,
  });

  @HiveField(0)
  late String token;

  @HiveField(1)
  late String refreshToken;

  @override
  String toString() {
    return 'token: $token ,refreshToken : $refreshToken';
  }
}
