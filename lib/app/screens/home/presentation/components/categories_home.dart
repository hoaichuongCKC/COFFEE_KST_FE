import 'package:coffee_kst/app/common/animations/do_fade/fade_in_right.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/bloc/tab_categ/change_tab_categ_cubit.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/navigation_bottom/navigation_screen_cubit.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product_type/product_type_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/item_cate_home.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/title_home.dart';
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
                  if (state.state is LoadingState) {
                    return skeletonType;
                  }
                  if (state.state is LoadFailedState) {
                    return errorWidget(state.messageError, context);
                  }
                  if (state.state is LoadedState) {
                    return FadeInRight(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final list = state.list;
                          return ItemCategHome(
                            data: list[index],
                            index: index,
                            onClicked: () {
                              context
                                  .read<ChangeTabCategCubit>()
                                  .changeTab(list[index].categ_name);
                              context
                                  .read<NavigationScreenCubit>()
                                  .changeNavigatorBottom(
                                      const DashboardScreenState());
                            },
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

  Padding errorWidget(String message, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          TextWidgets(
            text: message,
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
