import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/app/screens/detail/presentation/components/body_detail.dart';
import 'package:coffee_kst/app/screens/detail/presentation/components/header_detail.dart';
import 'package:coffee_kst/app/screens/detail/presentation/components/title_detail.dart';
import 'package:coffee_kst/app/screens/detail/presentation/widgets/bottom_navigator_detail.dart';
import 'package:coffee_kst/main_export.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      bottomNavigationBar: const BottomNavigatorDetail(),
      appBar: AppBarWidget(
        title: 'Chi tiết sản phẩm',
        context: context,
        onLeading: () {
          context.read<ProductDetaiServicelBloc>().add(ResetEvent());
        },
        actions: [
          SvgPicture.asset(AppIcons.FAVORITE_ASSET),
          const SizedBox(width: 10.0)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderDetail(),
          TitleDetail(),
          BodyDetail(),
        ],
      ),
    );
  }
}
