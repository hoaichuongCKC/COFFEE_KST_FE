import 'package:coffee_kst/main_export.dart';

class OverlayController {
  static OverlayEntry? _overlayEntry;
  static bool isVisible = false;
  static void showLoading(BuildContext context, Widget child) async {
    if (isVisible) return;
    OverlayController._createViewLoading(context, child);
  }

  static void dismiss() {
    if (isVisible) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      isVisible = false;
    }
  }

  static void _createViewLoading(BuildContext context, Widget child) async {
    var overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ViewOverlayWidget(
        duration: const Duration(milliseconds: 300),
        overlayEntry: _overlayEntry!,
        child: child,
      ),
    );
    isVisible = true;
    overlayState?.insert(_overlayEntry!);
  }
}

class ViewOverlayWidget extends StatefulWidget {
  const ViewOverlayWidget({
    Key? key,
    required this.overlayEntry,
    required this.duration,
    required this.child,
  }) : super(key: key);

  final OverlayEntry overlayEntry;
  final Duration duration;
  final Widget child;

  @override
  ToastWidgetState createState() => ToastWidgetState();
}

class ToastWidgetState extends State<ViewOverlayWidget>
    with SingleTickerProviderStateMixin {
//update this value later
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(widget.duration, () {});
        if (widget.overlayEntry.mounted) {
          widget.overlayEntry.remove();
          OverlayController.isVisible = false;
        }
      }
    });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.4,
          end: 1.0,
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.linearToEaseOut),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.child,
          ],
        ),
      ),
    );
  }
}
