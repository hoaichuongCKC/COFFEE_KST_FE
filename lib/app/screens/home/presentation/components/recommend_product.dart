import 'package:coffee_kst/app/common/components/item_product_horizontal.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/title_home.dart';
import 'package:coffee_kst/main_export.dart';

class RecommendTitleHome extends StatelessWidget {
  const RecommendTitleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleHomeWidget(
              label: 'Gợi ý sản phẩm',
              onTrailing: () {},
            ),
            const SizedBox(height: 8.0),
            const RecommendListProductHome(),
          ],
        ),
      ),
    );
  }
}

class RecommendListProductHome extends StatelessWidget {
  const RecommendListProductHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.state is ProductLoading) {
          return skeletonWidget;
        }
        if (state.state is ProductLoadFailed) {
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
                        context.read<ProductBloc>().add(LoadAllProductEvent()),
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
        if (state.state is ProductLoaded) {
          return ListView.separated(
            itemCount: state.listAllProduct.take(15).toList().length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(),
            itemBuilder: (context, index) {
              return ItemProductHorizontal(entity: state.listAllProduct[index]);
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget get skeletonWidget => const SkeletonWidget.rectangle(
        width: double.maxFinite,
        height: 110.0,
        borderRadius: RoundedRectangleBorder(
          borderRadius: AppStyles.borderRadius12,
        ),
      );
}
