import 'package:coffee_kst/app/screens/dashboard/presentation/bloc/tab_categ/change_tab_categ_cubit.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/widgets/item_dash.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/product_type.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product_type/product_type_bloc.dart';
import 'package:coffee_kst/core/utils/home.dart';
import 'package:coffee_kst/main_export.dart';

class ListTabbarCateg extends StatefulWidget {
  const ListTabbarCateg({super.key});

  @override
  State<ListTabbarCateg> createState() => _ListTabbarCategState();
}

class _ListTabbarCategState extends State<ListTabbarCateg> {
  List<ProductTypeEntity> list = [
    const ProductTypeEntity(categ_name: ALL),
    const ProductTypeEntity(categ_name: 'Bán chạy'),
  ];
  late ChangeTabCategCubit _categCubit;
  @override
  void initState() {
    super.initState();

    _categCubit = BlocProvider.of<ChangeTabCategCubit>(context);
    _categCubit.stream.listen((state) {
      _initScroll(state.currentTab);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initData();
  }

  _initData() async {
    final dataServer = context.watch<ProductTypeBloc>().state.list;
    for (ProductTypeEntity element in dataServer) {
      final index = dataServer.indexOf(element);
      list.insert(index + 1, element);
      listKey.add(GlobalKey());
    }
  }

  _initScroll(String tabName) {
    int index = 0;
    for (ProductTypeEntity element in list) {
      if (element.categ_name == tabName) {
        index = list.indexOf(element);
        break;
      }
    }
    BuildContext context = listKey[index].currentContext!;
    Scrollable.ensureVisible(context,
        alignment: 0.5,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  final List<GlobalKey> listKey = [GlobalKey(), GlobalKey()];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: double.maxFinite,
        maxWidth: double.maxFinite,
        minHeight: 50.0,
        maxHeight: 60.0,
      ),
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ItemCategDashboard(
          data: list[index],
          index: index,
          mykey: listKey[index],
        ),
      ),
    );
  }
}
