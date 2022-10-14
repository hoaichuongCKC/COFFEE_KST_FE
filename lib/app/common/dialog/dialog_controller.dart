import 'package:coffee_kst/app/common/dialog/dialog_failed.dart';
import 'package:coffee_kst/app/common/dialog/dialog_success.dart';
import 'package:coffee_kst/app/common/dialog/dialog_warning.dart';
import 'package:flutter/material.dart';

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

  Future successNotAction(BuildContext context) async {
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
        return const DialogSuccessNotAction();
      },
    );
  }
}
