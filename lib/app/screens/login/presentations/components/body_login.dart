// ignore_for_file: invalid_use_of_protected_member

import 'package:coffee_kst/app/common/animations/do_fade/fade_in.dart';
import 'package:coffee_kst/app/screens/login/presentations/bloc/auth/authentication_bloc.dart';

import 'package:coffee_kst/main_export.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isVisibilityClear = ValueNotifier<bool>(false);
  ValueNotifier<bool> isObscureText = ValueNotifier<bool>(true);
  ValueNotifier<LoginMethod> loginMethod =
      ValueNotifier(LoginMethod.PASSWORD_LOGIN);
  @override
  void initState() {
    phoneController.addListener(() {
      if (phoneController.hasListeners) {
        if (phoneController.text.isNotEmpty && !isVisibilityClear.value) {
          isVisibilityClear.value = true;
        } else if (phoneController.text.isEmpty && isVisibilityClear.value) {
          isVisibilityClear.value = false;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
    isVisibilityClear.dispose();
    isObscureText.dispose();
    loginMethod.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleApp(),
                const SizedBox(height: 25.0),
                _buildFormLogin(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.1,
          right: 0.0,
          child: _buildTypeLoginMethod(context, size),
        )
      ],
    );
  }

  Widget _buildTypeLoginMethod(BuildContext context, Size size) {
    return ValueListenableBuilder<LoginMethod>(
      valueListenable: loginMethod,
      builder: (context, LoginMethod currentMethod, child) {
        return GestureDetector(
          onTap: () => currentMethod.name == LoginMethod.PASSWORD_LOGIN.name
              ? loginMethod.value = LoginMethod.OTP_LOGIN
              : loginMethod.value = LoginMethod.PASSWORD_LOGIN,
          child: FadeInUp(
            delay: const Duration(milliseconds: 1900),
            child: LimitedBox(
              maxHeight: 30.0,
              child: SizedBox(
                width: size.width * 0.5,
                child: TextWidgets(
                  text: currentMethod.name == LoginMethod.PASSWORD_LOGIN.name
                      ? LOGIN_WITH_PHONE
                      : LOGIN_WITH_PASSWORD,
                  weight: FontWeight.w500,
                  textColor: AppColors.disableTextColor,
                  fontStyle: FontStyle.italic,
                  maxline: 2,
                  textDecoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFormLogin() {
    return FadeIn(
      delay: const Duration(milliseconds: 1500),
      duration: const Duration(milliseconds: 1000),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidgets(
              text: 'Đăng nhập',
              fontSize: AppDimens.text24,
              weight: FontWeight.w700,
            ),
            const SizedBox(height: 25.0),
            TextFormFieldLabel(
              onChanged: (value) => context
                  .read<AuthenticationBloc>()
                  .add(ChangedPhoneEvent(phone: value)),
              controller: phoneController,
              inputFormaters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
              ],
              label: 'Số điện thoại',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              hintText: 'Nhập số điện thoại của bạn',
              isRequired: true,
              suffixIcon: ValueListenableBuilder<bool>(
                  valueListenable: isVisibilityClear,
                  builder: (context, bool value, Widget? child) {
                    return Visibility(
                      visible: value,
                      child: GestureDetector(
                        onTap: () {
                          phoneController.text = '';
                          isVisibilityClear.value = false;
                          context
                              .read<AuthenticationBloc>()
                              .add(ChangedPhoneEvent(phone: ''));
                        },
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.clear,
                            size: AppDimens.icon15,
                            color: AppColors.darkColor,
                          ),
                        ),
                      ),
                    );
                  }),
              validator: (value) {
                if (value!.isEmpty) {
                  return MESSAGE_ERROR_VALIDATE_ISEMPTY;
                }
                return null;
              },
            ),
            ValueListenableBuilder<LoginMethod>(
              valueListenable: loginMethod,
              builder: (context, LoginMethod currentMethod, child) {
                if (currentMethod.name == LoginMethod.PASSWORD_LOGIN.name) {
                  return const SizedBox(height: 15.0);
                }
                return const SizedBox();
              },
            ),
            ValueListenableBuilder<LoginMethod>(
                valueListenable: loginMethod,
                builder: (context, LoginMethod currentMethod, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeIn,
                    child: currentMethod.name == LoginMethod.PASSWORD_LOGIN.name
                        ? ValueListenableBuilder<bool>(
                            valueListenable: isObscureText,
                            builder: (context, bool currentObscureText, child) {
                              return TextFormFieldLabel(
                                key: const ValueKey('form_password'),
                                onChanged: (value) => context
                                    .read<AuthenticationBloc>()
                                    .add(ChangedPasswordEvent(password: value)),
                                obscureText: currentObscureText,
                                onSubmit: (value) {
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(SubmitFormEvent());
                                },
                                controller: passwordController,
                                label: 'Mật khẩu',
                                hintText: 'Nhập mật khẩu của bạn',
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.name,
                                isRequired: true,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (!currentObscureText) {
                                      isObscureText.value = true;
                                    } else {
                                      isObscureText.value = false;
                                    }
                                  },
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Icon(
                                      currentObscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 15.0,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return MESSAGE_ERROR_VALIDATE_ISEMPTY;
                                  }
                                  return null;
                                },
                              );
                            })
                        : const SizedBox(),
                  );
                }),
            const SizedBox(height: 25.0),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    final bloc = context.watch<AuthenticationBloc>().state;
    if (bloc.phone.isEmpty && bloc.password.isEmpty) {
      return ButtonWidget(
        label: 'Đăng nhập',
        onClicked: null,
      );
    }
    return ButtonWidget(
      label: 'Đăng nhập',
      onClicked: () {
        if (formKey.currentState!.validate()) {
          context.read<AuthenticationBloc>().add(SubmitFormEvent());
        }
      },
    );
  }

  Row _buildTitleApp() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(
                from: 50,
                child: TextWidgets(
                  text: 'XIN CHÀO BẠN,',
                  fontSize: AppDimens.text24,
                  weight: FontWeight.w500,
                ),
              ),
              FadeInLeft(
                from: 50,
                delay: const Duration(milliseconds: 900),
                child: TextWidgets(
                  text: 'CHÀO MỪNG BẠN ĐẾN',
                  fontSize: AppDimens.text24,
                  weight: FontWeight.w500,
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 1000),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgets(
                      text: 'VỚI ',
                      fontSize: AppDimens.text24,
                      weight: FontWeight.w500,
                    ),
                    TextWidgets(
                      text: 'COFFEE KST',
                      fontSize: AppDimens.text24,
                      textColor: AppColors.primaryColor,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
