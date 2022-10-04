import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail/product_detail_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class TitleDetail extends StatelessWidget {
  const TitleDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        if (state is ProductDetailInitial) {
          return const SizedBox();
        }

        if (state is ProductDetailLoadFailed) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextWidgets(
              text: state.message,
              textColor: AppColors.textErrorColor,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              state is ProductDetailLoaded
                  ? TextWidgets(
                      text: state.data.name,
                      fontSize: AppDimens.text18,
                      weight: FontWeight.w500,
                      textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                    )
                  : state is ProductDetailLoading
                      ? const SkeletonWidget.rectangle(width: 150, height: 10)
                      : const SizedBox(),
              const SizedBox(height: 5.0),
              state is ProductDetailLoaded
                  ? TextWidgets(
                      text:
                          'Phân loại: ${state.data.categName} / 1 ${state.data.unit}',
                      fontSize: AppDimens.text12,
                      textColor: AppColors.disableTextColor,
                    )
                  : state is ProductDetailLoading
                      ? const SkeletonWidget.rectangle(width: 100, height: 10)
                      : const SizedBox(),
              const SizedBox(height: 5.0),
              state is ProductDetailLoaded
                  ? TextWidgets(
                      text: '${state.data.price1}đ',
                      fontSize: AppDimens.text16,
                      textColor: AppColors.textErrorColor,
                    )
                  : state is ProductDetailLoading
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
