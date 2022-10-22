import 'package:coffee_kst/app/common/widgets/text_form_widget.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/components/filter_overlay_state.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class AppBarDashBoard extends StatefulWidget {
  const AppBarDashBoard({super.key});

  @override
  State<AppBarDashBoard> createState() => _AppBarDashBoardState();
}

class _AppBarDashBoardState extends State<AppBarDashBoard> {
  final TextEditingController controller = TextEditingController();
  ValueNotifier<bool> isClear = ValueNotifier(false);

  @override
  void initState() {
    controller.addListener(() {
      if (controller.text.isEmpty && isClear.value) {
        isClear.value = false;
      } else if (controller.text.isNotEmpty && !isClear.value) {
        isClear.value = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    isClear.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        width: double.maxFinite,
        constraints: const BoxConstraints(
          minHeight: 80,
          maxHeight: 80 + 20,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.cakeColor.withAlpha(200),
              AppColors.primaryColor
            ],
          ),
          borderRadius: AppStyles.borderRadiusBottomLeftRight20,
        ),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgets(
                  text: 'Danh mục',
                  fontSize: AppDimens.text22,
                  textColor: AppColors.lightColor,
                  weight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () {
                    FilterOverlayState.showFilter(context);
                  },
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      AppIcons.FILTER_ASSET,
                      color: AppColors.lightColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            buildForm,
          ],
        ),
      ),
    );
  }

  Widget get buildForm => SizedBox(
        height: 40.0,
        child: TextFormFielddWidget.outlineBorder(
          contentPadding: const EdgeInsets.only(left: 7.0, right: 7.0),
          prefixIcon: const Icon(
            Icons.search,
            size: 18.0,
            color: AppColors.disableTextColor,
          ),
          suffixIcon: ValueListenableBuilder(
            valueListenable: isClear,
            child: const Icon(
              Icons.clear,
              size: 17.0,
              color: AppColors.darkColor,
            ),
            builder: (context, bool isClear, child) {
              return Visibility(
                visible: isClear,
                child: child!,
              );
            },
          ),
          hintText: "Tìm kiếm",
          onChanged: (value) {
            context.read<ProductBloc>().add(ChangedSearchEvent(value));
          },
          controller: controller,
        ),
      );
}
