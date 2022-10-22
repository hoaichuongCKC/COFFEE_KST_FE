import 'package:coffee_kst/app/screens/dashboard/presentation/components/filter_overlay_state.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class ButtonApply extends StatelessWidget {
  const ButtonApply({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ProductBloc>().state;
    return GestureDetector(
      onTap: () {
        if (bloc.keywordDistancePrice.isNotEmpty ||
            bloc.keywordNameType.isNotEmpty) {
          context.read<ProductBloc>().add(FilterProductEvent());
          FilterOverlayState.dismiss();
        }
      },
      child: Container(
        width: double.maxFinite,
        height: 40.0,
        decoration: BoxDecoration(
          color: (bloc.keywordDistancePrice.isEmpty &&
                  bloc.keywordNameType.isEmpty)
              ? AppColors.primaryColor.withAlpha(50)
              : AppColors.primaryColor,
          borderRadius: AppStyles.borderRadius5,
        ),
        alignment: Alignment.center,
        child: TextWidgets(
          text: 'Áp dụng',
          fontSize: AppDimens.text16,
          textColor: AppColors.lightColor,
        ),
      ),
    );
  }
}
