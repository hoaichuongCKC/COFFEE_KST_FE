import 'package:coffee_kst/main_export.dart';

class PushScale extends PageRouteBuilder {
  final Widget child;
  PushScale({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.3;
            const end = 1.0;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return ScaleTransition(
              scale: animation.drive(tween),
              child: child,
            );
          },
        );
}
