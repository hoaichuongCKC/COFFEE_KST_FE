import 'package:coffee_kst/app/common/components/item_best_seller.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/title_home.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';

class BestSellerHome extends StatelessWidget {
  const BestSellerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TitleHomeWidget(
              label: 'Sản phẩm hot tháng này',
              onTrailing: () {},
            ),
          ),
          const SizedBox(height: 8.0),
          LimitedBox(
            maxHeight: 250.0,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.listBestSeller.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 0.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: index == 4 ? 15.0 : 0.0),
                      child: InkWell(
                        onTap: () => AppRoutes.pushNamed(DETAIL_PATH),
                        child:
                            ItemBestSeller(entity: state.listBestSeller[index]),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
