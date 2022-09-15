// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:coffee_kst/main_export.dart';
import 'package:google_fonts/google_fonts.dart';

const double heightButton = 50.0;

class ButtonWidget extends StatefulWidget {
  ButtonWidget(
      {super.key,
      this.width = double.infinity,
      this.height = heightButton,
      this.backgroundColor = AppColors.primaryColor,
      required this.label,
      required this.onClicked,
      this.duration = const Duration(milliseconds: 110)});
  final double width;
  final double height;
  Color backgroundColor;
  final String label;
  final VoidCallback? onClicked;
  final Duration duration;
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late double _scale;

  // This controller is responsible for the animation
  late AnimationController _animate;

  //Getting the VoidCallack onPressed passed by the user
  VoidCallback get onPressed => widget.onClicked!;

  // This is a user defined duration, which will be responsible for
  // what kind of bounce he/she wants
  Duration get userDuration => widget.duration;

  //child widget
  @override
  void initState() {
    //defining the controller
    _animate = AnimationController(
        vsync: this,
        duration: const Duration(
            milliseconds: 200), //This is an inital controller duration
        lowerBound: 0.0,
        upperBound: 0.1)
      ..addListener(() {
        setState(() {});
      }); // Can do something in the listener, but not required
    super.initState();
  }

  void _onTap() {
    //Firing the animation right away
    _animate.forward();

    //Now reversing the animation after the user defined duration
    Future.delayed(userDuration, () {
      _animate.reverse();

      //Calling the callback
      onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onClicked == null) {
      widget.backgroundColor = AppColors.disablePrimaryButtonColor;
    }
    _scale = 1 - _animate.value;
    return GestureDetector(
      onTap: widget.onClicked == null ? null : _onTap,
      child: Transform.scale(
        scale: _scale,
        child: CustomPaint(
          size: Size(widget.width, widget.height),
          painter: DrawButtonWidget(widget.label,
              backgroundColor: widget.backgroundColor),
        ),
      ),
    );
  }
}

class DrawButtonWidget extends CustomPainter {
  final Color backgroundColor;
  final String lable;
  DrawButtonWidget(
    this.lable, {
    required this.backgroundColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    //draw background button
    var paintBtn = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(size.width * 0, size.height / 2);
    path.lineTo(size.width * 0.05, size.height * 0);
    path.lineTo(size.width * 0.95, size.height * 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.95, size.height);
    path.lineTo(size.width * 0.05, size.height);
    path.lineTo(size.width * 0, size.height / 2);
    canvas.drawPath(path, paintBtn);
    path.close();

    //draw text
    final textSpan = TextSpan(
      text: lable,
      style: GoogleFonts.poppins(
        fontSize: AppDimens.text14,
        color: AppColors.lightColor,
        fontWeight: FontWeight.w500,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
