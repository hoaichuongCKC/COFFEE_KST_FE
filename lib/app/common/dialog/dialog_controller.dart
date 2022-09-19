import 'package:coffee_kst/app/common/dialog/dialog_failed.dart';
import 'package:coffee_kst/app/common/dialog/dialog_success.dart';
import 'package:flutter/material.dart';

class DialogController {
  static DialogController instance = DialogController();

  void success({
    required String message,
    required BuildContext context,
  }) async {
    await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.1,
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
          onConfirm: () {},
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
            begin: 0.1,
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
        return DialogFailed(
          confirm: 'Thử lại',
          message: message,
          onConfirm: () {},
        );
      },
    );
  }
}
