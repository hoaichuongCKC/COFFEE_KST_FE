// ignore_for_file: constant_identifier_names
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/app/screens/detail/presentation/widgets/item_rating.dart';
import 'package:coffee_kst/app/screens/detail/presentation/widgets/item_topping.dart';
import 'package:coffee_kst/app/screens/detail/presentation/widgets/tab_bar_detail.dart';
import 'package:coffee_kst/main_export.dart';

enum TabDetail {
  DESCRIPTION,
  RATING,
  TOPPING,
}

// ignore: must_be_immutable
class BodyDetail extends StatefulWidget {
  const BodyDetail({Key? key}) : super(key: key);

  @override
  State<BodyDetail> createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  ValueNotifier<TabDetail> currentTab = ValueNotifier(TabDetail.TOPPING);
  @override
  void dispose() {
    currentTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabbarDetail(
              onChanged: (TabDetail tab) {
                currentTab.value = tab;
              },
            ),
            const SizedBox(height: 20.0),
            BlocBuilder<ProductDetaiServicelBloc, ProductDetailServiceState>(
              buildWhen: (previous, current) => previous.state != current.state,
              builder: (context, state) {
                if (state.state is ProductDetailLoaded) {
                  return ValueListenableBuilder(
                    valueListenable: currentTab,
                    builder: (context, TabDetail tab, child) {
                      if (tab == TabDetail.DESCRIPTION) {
                        return TextWidgets(
                          text: state.data.description,
                          textColor: AppColors.disableTextColor,
                          maxline: 10,
                          fontSize: AppDimens.text14,
                        );
                      } else if (tab == TabDetail.TOPPING) {
                        return Expanded(
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 20.0),
                            itemCount: state.data.toppings.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ItemToppingDetail(
                                toppingEntity: state.data.toppings[index],
                              );
                            },
                          ),
                        );
                      } else if (tab == TabDetail.RATING) {
                        if (state.data.reviews.isEmpty) {
                          return Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  TextWidgets(
                                    text: 'Hiện tại chưa có đánh giá nào',
                                    fontSize: AppDimens.text14,
                                    textColor: AppColors.disableTextColor,
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        return Expanded(
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 20.0),
                                Divider(),
                              ],
                            ),
                            itemCount: state.data.reviews.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ItemRatingDetail(
                                  enity: state.data.reviews[index]);
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  );
                }
                if (state.state is ProductDetailLoading) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SkeletonWidget.rectangle(
                        width: double.maxFinite,
                        height: 20.0,
                        borderRadius: RoundedRectangleBorder(
                          borderRadius: AppStyles.borderRadius5,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SkeletonWidget.rectangle(
                        width: double.maxFinite,
                        height: 20.0,
                        borderRadius: RoundedRectangleBorder(
                          borderRadius: AppStyles.borderRadius5,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SkeletonWidget.rectangle(
                        width: double.maxFinite,
                        height: 20.0,
                        borderRadius: RoundedRectangleBorder(
                          borderRadius: AppStyles.borderRadius5,
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
