// ignore_for_file: constant_identifier_names

import 'package:coffee_kst/main_export.dart';

enum ToggleSwitch {
  TURN_ON,
  TURN_OFF,
}

class ToggleWidget extends StatelessWidget {
  const ToggleWidget(
      {Key? key, required this.onChanged, required this.currentValue})
      : super(key: key);
  final Function(ToggleSwitch) onChanged;
  final ToggleSwitch currentValue;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(currentValue),
      borderRadius: AppStyles.borderRadius20,
      radius: 40.0,
      child: Container(
        width: 60.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: AppStyles.borderRadius20,
        ),
        constraints: const BoxConstraints(
          minHeight: 25.0,
          minWidth: 50.0,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutSine,
              alignment: currentValue == ToggleSwitch.TURN_OFF
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: 60 / 2.0,
                height: double.maxFinite,
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: currentValue == ToggleSwitch.TURN_OFF
                      ? AppColors.disablePrimaryButtonColor
                      : AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
