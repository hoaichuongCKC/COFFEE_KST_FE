import 'package:coffee_kst/main_export.dart';

class TitleHomeWidget extends StatelessWidget {
  const TitleHomeWidget(
      {Key? key, required this.label, required this.onTrailing})
      : super(key: key);
  final String label;
  final Function() onTrailing;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidgets(
          text: label,
          fontSize: AppDimens.text18,
          weight: FontWeight.w500,
          textColor: Theme.of(context).textTheme.bodyMedium!.color!,
        ),
        const Spacer(),
        InkWell(
          onTap: onTrailing,
          child: SvgPicture.asset(AppIcons.ARROW_RIGHT_ASSET),
        )
      ],
    );
  }
}
