import 'package:coffee_kst/app/common/components/avatar_small.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AvatarUserSmall(),
              const SizedBox(width: 10.0),
              TextWidgets(
                text: 'Chào bạn!',
                fontSize: AppDimens.text16,
                textColor: Theme.of(context).textTheme.bodyMedium!.color!,
              ),
              const Spacer(),
              SvgPicture.asset(AppIcons.SEARCH_ASSET),
              const SizedBox(width: 10.0),
              GestureDetector(
                  onTap: () => AppRoutes.pushNamed(NOTIFICATION_PATH),
                  child: SvgPicture.asset(AppIcons.NOTIFICATION_ASSET)),
            ],
          ),
        ),
      ),
    );
  }
}
