import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class TitleDetail extends StatelessWidget {
  const TitleDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetaiServicelBloc, ProductDetailServiceState>(
      buildWhen: (previous, current) =>
          previous.state != current.state ||
          previous.defautlPrice != current.defautlPrice,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              state.state is ProductDetailLoaded
                  ? TextWidgets(
                      text: state.data.name,
                      fontSize: AppDimens.text18,
                      weight: FontWeight.w500,
                      textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                    )
                  : state.state is ProductDetailLoading
                      ? const SkeletonWidget.rectangle(width: 150, height: 10)
                      : const SizedBox(),
              const SizedBox(height: 5.0),
              state.state is ProductDetailLoaded
                  ? TextWidgets(
                      text:
                          'Phân loại: ${state.data.categName} / 1 ${state.data.unit}',
                      fontSize: AppDimens.text12,
                      textColor: AppColors.disableTextColor,
                    )
                  : state.state is ProductDetailLoading
                      ? const SkeletonWidget.rectangle(width: 100, height: 10)
                      : const SizedBox(),
              const SizedBox(height: 5.0),
              state.state is ProductDetailLoaded
                  ? TextWidgets(
                      text: Convert.instance.convertVND(state.defautlPrice),
                      fontSize: AppDimens.text16,
                      textColor: AppColors.textErrorColor,
                    )
                  : state.state is ProductDetailLoading
                      ? const SkeletonWidget.rectangle(width: 70, height: 10)
                      : const SizedBox(),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
