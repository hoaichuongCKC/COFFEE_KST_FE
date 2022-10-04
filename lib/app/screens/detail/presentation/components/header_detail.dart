import 'package:coffee_kst/app/common/animations/do_fade/fade_in_right.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail/product_detail_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class HeaderDetail extends StatelessWidget {
  const HeaderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        if (state is ProductDetailLoaded) {
          return Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageWidget(
                  url: state.data.imageUrl,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FadeInRight(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.data.size2.isNotEmpty
                              ? Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 35.0,
                                    minWidth: 25.0,
                                    maxHeight: 35.0,
                                    minHeight: 25.0,
                                  ),
                                  decoration: const ShapeDecoration(
                                    color: AppColors.primaryColor,
                                    shape: CircleBorder(),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextWidgets(
                                    text: state.data.size1,
                                    textColor: AppColors.lightColor,
                                  ),
                                )
                              : const SizedBox(),
                          state.data.size2.isNotEmpty
                              ? const SizedBox(height: 8.0)
                              : const SizedBox(),
                          state.data.size2.isNotEmpty
                              ? Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 35.0,
                                    minWidth: 25.0,
                                    maxHeight: 35.0,
                                    minHeight: 25.0,
                                  ),
                                  decoration: const ShapeDecoration(
                                    color: AppColors.primaryColor,
                                    shape: CircleBorder(),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextWidgets(
                                    text: state.data.size2,
                                    textColor: AppColors.lightColor,
                                  ),
                                )
                              : const SizedBox(),
                          state.data.size3.isNotEmpty
                              ? const SizedBox(height: 8.0)
                              : const SizedBox(),
                          state.data.size3.isNotEmpty
                              ? Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 35.0,
                                    minWidth: 25.0,
                                    maxHeight: 35.0,
                                    minHeight: 25.0,
                                  ),
                                  decoration: const ShapeDecoration(
                                    color: AppColors.primaryColor,
                                    shape: CircleBorder(),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextWidgets(
                                    text: state.data.size3,
                                    textColor: AppColors.lightColor,
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        if (state is ProductDetailLoading) {
          return const Expanded(
            child: SkeletonWidget.rectangle(
              width: double.maxFinite,
              height: double.maxFinite,
              borderRadius: RoundedRectangleBorder(
                borderRadius: AppStyles.borderRadius10,
              ),
            ),
          );
        }
        if (state is ProductDetailLoadFailed) {
          return Expanded(
              child: TextWidgets(
            text: state.message,
            textColor: AppColors.textErrorColor,
            fontSize: AppDimens.text14,
            maxline: 3,
          ));
        }
        return const SizedBox();
      },
    );
  }
}
