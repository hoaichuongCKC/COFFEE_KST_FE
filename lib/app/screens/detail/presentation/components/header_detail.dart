import 'package:coffee_kst/app/common/animations/do_fade/fade_in_right.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class HeaderDetail extends StatelessWidget {
  const HeaderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetaiServicelBloc, ProductDetailServiceState>(
      buildWhen: (previous, current) =>
          previous.sizeName != current.sizeName || previous.sizeName.isEmpty,
      builder: (context, state) {
        if (state.state is ProductDetailLoaded) {
          return Container(
            width: double.maxFinite,
            height: 250,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.2,
              maxHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: AppStyles.borderRadius12,
                    child: ImageWidget(
                      url: state.data.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 10.0,
                  bottom: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FadeInRight(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.data.size1.isNotEmpty
                              ? GestureDetector(
                                  onTap: () => context
                                      .read<ProductDetaiServicelBloc>()
                                      .add(ChooseSizeEvent(
                                          size: state.data.size1)),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    constraints: const BoxConstraints(
                                      maxWidth: 35.0,
                                      minWidth: 25.0,
                                      maxHeight: 35.0,
                                      minHeight: 25.0,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: state.sizeName == state.data.size1
                                          ? AppColors.primaryColor
                                          : AppColors.lightColor,
                                      shape: const CircleBorder(),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextWidgets(
                                      text: state.data.size1,
                                      weight: FontWeight.w600,
                                      textColor:
                                          state.sizeName == state.data.size1
                                              ? AppColors.lightColor
                                              : AppColors.primaryColor,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          state.data.size2.isNotEmpty
                              ? const SizedBox(height: 8.0)
                              : const SizedBox(),
                          state.data.size2.isNotEmpty
                              ? GestureDetector(
                                  onTap: () => context
                                      .read<ProductDetaiServicelBloc>()
                                      .add(ChooseSizeEvent(
                                          size: state.data.size2)),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    constraints: const BoxConstraints(
                                      maxWidth: 35.0,
                                      minWidth: 25.0,
                                      maxHeight: 35.0,
                                      minHeight: 25.0,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: state.sizeName == state.data.size2
                                          ? AppColors.primaryColor
                                          : AppColors.lightColor,
                                      shape: const CircleBorder(),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextWidgets(
                                      text: state.data.size2,
                                      weight: FontWeight.w600,
                                      textColor:
                                          state.sizeName == state.data.size2
                                              ? AppColors.lightColor
                                              : AppColors.primaryColor,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          state.data.size3.isNotEmpty
                              ? const SizedBox(height: 8.0)
                              : const SizedBox(),
                          state.data.size3.isNotEmpty
                              ? GestureDetector(
                                  onTap: () => context
                                      .read<ProductDetaiServicelBloc>()
                                      .add(ChooseSizeEvent(
                                          size: state.data.size3)),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    constraints: const BoxConstraints(
                                      maxWidth: 35.0,
                                      minWidth: 25.0,
                                      maxHeight: 35.0,
                                      minHeight: 25.0,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: state.sizeName == state.data.size3
                                          ? AppColors.primaryColor
                                          : AppColors.lightColor,
                                      shape: const CircleBorder(),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextWidgets(
                                      text: state.data.size3,
                                      weight: FontWeight.w600,
                                      textColor:
                                          state.sizeName == state.data.size3
                                              ? AppColors.lightColor
                                              : AppColors.primaryColor,
                                    ),
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
        if (state.state is ProductDetailLoading) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 250,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.2,
              maxHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            child: const SkeletonWidget.rectangle(
              width: double.maxFinite,
              height: double.maxFinite,
              borderRadius: RoundedRectangleBorder(
                borderRadius: AppStyles.borderRadius10,
              ),
            ),
          );
        }
        if (state.state is ProductDetailLoadFailed) {
          return TextWidgets(
            text: state.message,
            textColor: AppColors.textErrorColor,
            fontSize: AppDimens.text14,
            maxline: 3,
          );
        }
        return const SizedBox();
      },
    );
  }
}
