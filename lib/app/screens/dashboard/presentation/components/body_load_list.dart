import 'package:coffee_kst/app/common/components/item_product_horizontal.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/bloc/tab_categ/change_tab_categ_cubit.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/core/utils/home.dart';
import 'package:coffee_kst/main_export.dart';

class BodyLoadList extends StatelessWidget {
  const BodyLoadList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listenWhen: ((previous, current) => current.filterState is FilterLoading),
      listener: (context, state) {
        if (BlocProvider.of<ChangeTabCategCubit>(context).state.currentTab !=
            ALL) {
          context.read<ChangeTabCategCubit>().changeTab(ALL);
        }
      },
      buildWhen: ((previous, current) =>
          previous.listSearch != current.listSearch ||
          current.state is ProductLoaded ||
          previous.filterState != current.filterState),
      builder: (context, state) {
        if (state.state is ProductLoaded && state.filterState is FilterLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              TextWidgets(
                text: 'Tìm thấy ${state.listSearch.length} kết quả',
                textColor: AppColors.disableTextColor,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: state.listSearch.length,
                  itemBuilder: (context, index) {
                    return ItemProductHorizontal(
                        entity: state.listSearch[index]);
                  },
                ),
              ),
            ],
          );
        } else if (state.state is ProductLoaded &&
            state.filterState is FilterLoading) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loading,
              ],
            ),
          );
        } else if (state.state is ProductLoaded &&
            state.filterState is FilterNotDataEmpty) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidgets(
                  text: 'Không có sản phẩm nào theo như yêu cầu',
                  maxline: 2,
                  fontSize: AppDimens.text14,
                  textColor: AppColors.disableTextColor,
                ),
              ],
            ),
          );
        } else if (state.state is ProductLoaded &&
            state.filterState is FilterInitital) {
          return BlocBuilder<ChangeTabCategCubit, ChangeTabCategState>(
            buildWhen: (previous, current) =>
                previous.currentTab != current.currentTab,
            builder: (context, stateChangeTab) {
              return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeInCubic,
                  child: stateChangeTab.currentTab == ALL
                      ? ListView.builder(
                          key: ValueKey(stateChangeTab.currentTab),
                          itemCount: state.listAllProduct.length,
                          itemBuilder: (context, index) {
                            return ItemProductHorizontal(
                                entity: state.listAllProduct[index]);
                          },
                        )
                      : stateChangeTab.currentTab == COFFEE_TYPE
                          ? ListView.builder(
                              key: ValueKey(stateChangeTab.currentTab),
                              itemCount: state.listCoffee.length,
                              itemBuilder: (context, index) {
                                return ItemProductHorizontal(
                                    entity: state.listCoffee[index]);
                              },
                            )
                          : stateChangeTab.currentTab == TEA_TYPE
                              ? ListView.builder(
                                  key: ValueKey(stateChangeTab.currentTab),
                                  itemCount: state.listTea.length,
                                  itemBuilder: (context, index) {
                                    return ItemProductHorizontal(
                                        entity: state.listTea[index]);
                                  },
                                )
                              : stateChangeTab.currentTab == CAKE_TYPE
                                  ? ListView.builder(
                                      key: ValueKey(stateChangeTab.currentTab),
                                      itemCount: state.listCake.length,
                                      itemBuilder: (context, index) {
                                        return ItemProductHorizontal(
                                            entity: state.listCake[index]);
                                      },
                                    )
                                  : ListView.builder(
                                      key: ValueKey(stateChangeTab.currentTab),
                                      itemCount: state.listBestSeller.length,
                                      itemBuilder: (context, index) {
                                        return ItemProductHorizontal(
                                            entity:
                                                state.listBestSeller[index]);
                                      },
                                    ));
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
