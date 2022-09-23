import 'package:coffee_kst/main_export.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: TextWidgets(
            text: 'Home page',
            textColor: Theme.of(context).textTheme.bodyMedium!.color!,
          ),
        )
      ],
    );
  }
}
