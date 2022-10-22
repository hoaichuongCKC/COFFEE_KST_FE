import 'package:coffee_kst/app/screens/dashboard/presentation/bloc/tab_categ/change_tab_categ_cubit.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/product_type.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class ItemCategDashboard extends StatelessWidget {
  const ItemCategDashboard({
    Key? key,
    required this.data,
    required this.index,
    required this.mykey,
  }) : super(key: key);

  final ProductTypeEntity data;
  final int index;
  final GlobalKey mykey;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ProductBloc>(context, listen: false);
    return InkWell(
      onTap: () {
        if (bloc.state.listSearch.isNotEmpty ||
            bloc.state.filterState is FilterNotDataEmpty) {
          context.read<ProductBloc>().add(ResetList());
        }
        context.read<ChangeTabCategCubit>().changeTab(data.categ_name);
      },
      borderRadius: AppStyles.borderRadius10,
      splashColor: AppColors.disableTextColor.withAlpha(10),
      child: BlocBuilder<ChangeTabCategCubit, ChangeTabCategState>(
        buildWhen: (previous, current) =>
            previous.currentTab != current.currentTab,
        builder: (context, stateCurrentTab) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInBack,
            key: mykey,
            decoration: BoxDecoration(
                color: AppColors.lightColor,
                border: stateCurrentTab.currentTab == data.categ_name
                    ? const Border(
                        bottom: BorderSide(
                            color: AppColors.primaryColor, width: 4.0),
                      )
                    : null),
            width: 100,
            height: 60,
            child: Center(
              child: TextWidgets(
                text: data.categ_name,
                fontSize: AppDimens.text16,
                textColor: stateCurrentTab.currentTab == data.categ_name
                    ? AppColors.primaryColor
                    : AppColors.disableTextColor,
                weight: stateCurrentTab.currentTab == data.categ_name
                    ? FontWeight.w500
                    : FontWeight.w300,
              ),
            ),
          );
        },
      ),
    );
  }
}
