import 'dart:convert';
import 'package:coffee_kst/app/screens/login/data/models/login.dart';
import 'package:coffee_kst/app/screens/login/data/models/login_otp.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthLoginRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<LoginModel> login(String phone, String password);

  //atuh phone firebase
  Future<LoginOTPModel> loginOTP(String phone);
}

class AuthLoginRemoteDataSourceImpl
    with Api
    implements AuthLoginRemoteDataSource {
  AuthLoginRemoteDataSourceImpl();

  @override
  Future<LoginModel> login(String phone, String password) async {
    //params
    final data = jsonEncode(
      {
        "params": {
          "phone": phone,
          "password": password,
        }
      },
    );
    final response = await postService(ENDPOINT_LOGIN, data: data);
    return LoginModel.fromJson(
        jsonDecode(jsonEncode(response.data['results'])));
  }

  @override
  Future<LoginOTPModel> loginOTP(String phone) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    LoginOTPModel model = LoginOTPModel.init();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+84 $phone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        model.smsCode = credential.smsCode!;
        await auth.signInWithCredential(credential).then((value) {});
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        model.verificationId = verificationId;
        model.resendToken = resendToken!;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return model;
  }
}
