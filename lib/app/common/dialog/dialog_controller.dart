import 'package:coffee_kst/app/common/dialog/dialog_failed.dart';
import 'package:coffee_kst/app/common/dialog/dialog_success.dart';
import 'package:coffee_kst/app/common/dialog/dialog_warning.dart';
import 'package:coffee_kst/main_export.dart';

class DialogController {
  static DialogController instance = DialogController();

  void success({
    required String message,
    required BuildContext context,
    Function()? onClicked,
  }) async {
    await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.4,
            end: 1.0,
          ).animate(
            CurvedAnimation(parent: a1, curve: Curves.linearToEaseOut),
          ),
          child: Opacity(
            opacity: a1.value,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DialogSuccess(
          confirm: 'Ok',
          message: message,
          onConfirm: onClicked!,
        );
      },
    );
  }

  void failed({
    required String message,
    required BuildContext context,
  }) async {
    await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.4,
            end: 1.0,
          ).animate(
            CurvedAnimation(parent: a1, curve: Curves.linearToEaseOut),
          ),
          child: Opacity(
            opacity: a1.value,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DialogFailed(
          confirm: 'Thử lại',
          message: message,
          onConfirm: () {},
        );
      },
    );
  }

  void warning({
    required String message,
    required BuildContext context,
    required Function() onConfirm,
    required Function() onCancle,
    String? nameConfirm,
    String? nameCancle,
  }) async {
    await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.4,
            end: 1.0,
          ).animate(
            CurvedAnimation(parent: a1, curve: Curves.linearToEaseOut),
          ),
          child: Opacity(
            opacity: a1.value,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DialogWarning(
          message: message,
          onConfirm: onConfirm,
          onCancel: onCancle,
          nameConfirm: nameConfirm,
          nameCancle: nameCancle,
        );
      },
    );
  }

  Future successNotAction(BuildContext context, String msg) async {
    await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, child) {
        return Opacity(
          opacity: a1.value,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DialogSuccessNotAction(msg: msg);
      },
    );
  }

  showLoading(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Dialog(
          elevation: 10.0,
          shape: const RoundedRectangleBorder(
            borderRadius: AppStyles.borderRadius12,
          ),
          backgroundColor: AppColors.lightColor,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            constraints: const BoxConstraints(
              minWidth: 80,
              minHeight: 80,
              maxHeight: 100,
              maxWidth: 100,
            ),
            alignment: Alignment.center,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loading,
                  const SizedBox(height: 6.0),
                  TextWidgets(
                    text: 'Vui lòng đợi',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.darkColor,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
