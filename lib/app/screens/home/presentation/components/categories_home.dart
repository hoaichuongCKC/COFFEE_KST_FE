import 'package:coffee_kst/app/common/animations/do_fade/fade_in_right.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product_type/product_type_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/title_home.dart';
import 'package:coffee_kst/core/utils/home.dart';
import 'package:coffee_kst/main_export.dart';

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TitleHomeWidget(label: 'Danh mục', onTrailing: () {}),
            ),
            const SizedBox(height: 8.0),
            LimitedBox(
              maxHeight: 70.0,
              child: BlocBuilder<ProductTypeBloc, ProductTypeState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return skeletonType;
                  }
                  if (state is LoadFailedState) {
                    return errorWidget(state, context);
                  }
                  if (state is LoadedState) {
                    return FadeInRight(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final list = state.list;
                          return Container(
                            margin: EdgeInsets.only(
                                left: 15.0, right: index == 2 ? 15.0 : 0.0),
                            padding: const EdgeInsets.all(10.0),
                            constraints: const BoxConstraints(
                              minWidth: 110.0,
                              minHeight: 60.0,
                              maxHeight: 70.0,
                              maxWidth: 120.0,
                            ),
                            decoration: BoxDecoration(
                              color: list[index].categ_name == COFFEE_TYPE
                                  ? AppColors.primaryColor
                                  : list[index].categ_name == CAKE_TYPE
                                      ? AppColors.cakeColor
                                      : AppColors.drinkColor,
                              borderRadius: AppStyles.borderRadius12,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  list[index].categ_name == COFFEE_TYPE
                                      ? AppIcons.CATEG_COFFEE_ASSET
                                      : list[index].categ_name == CAKE_TYPE
                                          ? AppIcons.CATEG_CAKE_ASSET
                                          : AppIcons.CATEG_TEA_ASSET,
                                  color: AppColors.lightColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidgets(
                                          text: 'Loại',
                                          fontSize: AppDimens.text14),
                                      TextWidgets(
                                        text: state.list[index].categ_name,
                                        fontSize: AppDimens.text12,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 0.0),
                        itemCount: state.list.length,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding errorWidget(LoadFailedState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          TextWidgets(
            text: state.messageError,
            maxline: 3,
            fontSize: AppDimens.text14,
            textColor: AppColors.textErrorColor,
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () =>
                  context.read<ProductTypeBloc>().add(LoadTypeProductEvent()),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: TextWidgets(
                    text: 'Kết nối lại',
                    fontSize: AppDimens.text16,
                    textColor: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get skeletonType => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: const [
            SkeletonWidget.rectangle(
              width: 100,
              height: 70,
              borderRadius: RoundedRectangleBorder(
                borderRadius: AppStyles.borderRadius10,
              ),
            ),
            Spacer(),
            SkeletonWidget.rectangle(
              width: 100,
              height: 70,
              borderRadius: RoundedRectangleBorder(
                borderRadius: AppStyles.borderRadius10,
              ),
            ),
            Spacer(),
            SkeletonWidget.rectangle(
              width: 100,
              height: 70,
              borderRadius: RoundedRectangleBorder(
                borderRadius: AppStyles.borderRadius10,
              ),
            ),
          ],
        ),
      );
}
