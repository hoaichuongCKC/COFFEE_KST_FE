import 'package:coffee_kst/app/screens/login/presentations/bloc/auth_phone/auth_phone_bloc.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class FormPinputOTP extends StatefulWidget {
  const FormPinputOTP({Key? key}) : super(key: key);
  @override
  State<FormPinputOTP> createState() => _FormPinputOTPState();
}

class _FormPinputOTPState extends State<FormPinputOTP> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late AuthPhoneBloc bloc;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    senOTP();
    // bloc = BlocProvider.of<AuthPhoneBloc>(context);

    // bloc.stream.listen((state) {
    //   print("stream: ${state.otpCode}");
    //   print(state.state);
    //   if (state.state is AuthPhoneCodeSentSuccess) {
    //     controller.text = state.otpCode;
    //     bloc.add(VerifySentOtpEvent(
    //         otpCode: state.otpCode, verificationId: state.verificationId));
    //   } else if (state.state is AuthPhoneError) {
    //     Toast.show(state.messageError, context, 4);
    //   } else if (state.state is AuthPhoneVerified) {
    //     AppRoutes.pushNamed(CREATE_ACCOUNT_PATH);
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: size.width * .12,
      height: Theme.of(context).brightness == Brightness.dark
          ? size.width * 0.15
          : size.width * .1,
      textStyle: GoogleFonts.nunito(
        fontSize: AppDimens.text24,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
      ),
      decoration: Theme.of(context).brightness == Brightness.dark
          ? AppStyles.pinputOutline
          : AppStyles.pinputUnderline,
    );
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Pinput(
              length: 6,
              controller: controller,
              separator: Container(width: size.width * .02),
              defaultPinTheme: defaultPinTheme,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              showCursor: true,
              errorTextStyle: GoogleFonts.nunito(
                fontSize: AppDimens.text12,
                color: AppColors.textErrorColor,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (pin) {
                if (pin == "123513") {
                  return null;
                }

                return null;
              },
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: AppStyles.pinputUnderline,
              ),
            ),
          ),
          const SizedBox(height: 15.0),

          // const AgainSendOTP(),
        ],
      ),
    );
  }

  void senOTP() async {
    final auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+84 0918031587',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // add(OnGetOTPEvent(otpCode: credential.smsCode!));
        // On [verificationComplete], we will get the credential from the firebase  and will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
      },
      verificationFailed: (FirebaseAuthException e) {
        // On [verificationFailed], we will get the exception from the firebase and will send it to the [OnPhoneAuthErrorEvent] event to be handled by the bloc and then will emit the [PhoneAuthError] state in order to display the error to the user's screen
      },
      codeSent: (String verificationId, int? resendToken) {
        // On [codeSent], we will get the verificationId and the resendToken from the firebase and will send it to the [OnPhoneOtpSent] event to be handled by the bloc and then will emit the [OnPhoneAuthVerificationCompleteEvent] event after receiving the code from the user's phone
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
