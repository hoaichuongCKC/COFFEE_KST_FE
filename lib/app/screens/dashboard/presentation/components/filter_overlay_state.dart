// ignore_for_file: unused_local_variable

import 'package:coffee_kst/app/common/widgets/checkbox_widget.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/widgets/button_apply.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product_type/product_type_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class FilterOverlayState {
  static OverlayEntry? _overlayEntry;
  static bool isVisible = false;
  static void showFilter(BuildContext context) async {
    if (isVisible) return;
    FilterOverlayState._createViewFilter(context);
  }

  static void dismiss() {
    if (isVisible) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      isVisible = false;
    }
  }

  static void _createViewFilter(BuildContext context) async {
    var overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => FilterProductWidget(
        overlayEntry: _overlayEntry!,
      ),
    );
    isVisible = true;
    overlayState?.insert(_overlayEntry!);
  }
}

class FilterProductWidget extends StatefulWidget {
  const FilterProductWidget({super.key, required this.overlayEntry});
  final OverlayEntry overlayEntry;

  @override
  State<FilterProductWidget> createState() => _FilterProductWidgetState();
}

class _FilterProductWidgetState extends State<FilterProductWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationController.forward();
    super.initState();
  }

  final List<ValueNotifier<bool>> listValueNotifier = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _init();
  }

  _init() {
    for (var element in context.watch<ProductTypeBloc>().state.list) {
      listValueNotifier.add(ValueNotifier(false));
    }
  }

  ValueNotifier<bool> isCheckFirst = ValueNotifier(false);
  ValueNotifier<bool> isCheckSecond = ValueNotifier(false);
  ValueNotifier<bool> isCheckThirty = ValueNotifier(false);
  @override
  void dispose() {
    isCheckFirst.dispose();
    isCheckSecond.dispose();
    isCheckThirty.dispose();
    for (var element in listValueNotifier) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.6,
          end: 1.0,
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.linearToEaseOut),
        ),
        child: GestureDetector(
          onTap: () => FilterOverlayState.dismiss(),
          child: Material(
            type: MaterialType.button,
            borderOnForeground: false,
            animationDuration: const Duration(milliseconds: 0),
            color: AppColors.darkColor.withOpacity(0.5),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.all(15.0),
                  // width: size.width * 0.75,
                  // height: size.height * 0.75,
                  decoration: const BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius: AppStyles.borderRadius12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidgets(
                            text: 'Bộ lọc tìm kiếm',
                            fontSize: AppDimens.text20,
                            textColor: AppColors.darkColor,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              FilterOverlayState.dismiss();
                              context
                                  .read<ProductBloc>()
                                  .add(const AddKeyFilterPrice(''));
                              context
                                  .read<ProductBloc>()
                                  .add(const AddKeyFilterPrice(''));
                            },
                            child: const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.clear,
                                size: 18.0,
                                color: AppColors.darkColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      TextWidgets(
                        text: '*Theo giá tiền',
                        textColor: AppColors.darkColor,
                        fontSize: AppDimens.text14,
                      ),
                      const SizedBox(height: 15),
                      FilterRangePrice(
                        isCheckThirty: isCheckThirty,
                        isCheckFirst: isCheckFirst,
                        isCheckSecond: isCheckSecond,
                        onChangeFirst: (value) => context
                            .read<ProductBloc>()
                            .add(AddKeyFilterPrice(value)),
                        onChangeSecond: (value) => context
                            .read<ProductBloc>()
                            .add(AddKeyFilterPrice(value)),
                        onChangeThirty: (value) => context
                            .read<ProductBloc>()
                            .add(AddKeyFilterPrice(value)),
                      ),
                      const SizedBox(height: 10),
                      FilterProduct(listValueNotifier: listValueNotifier),
                      const SizedBox(height: 10.0),
                      const ButtonApply(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterRangePrice extends StatelessWidget {
  const FilterRangePrice({
    Key? key,
    required this.isCheckFirst,
    required this.isCheckSecond,
    required this.isCheckThirty,
    required this.onChangeFirst,
    required this.onChangeSecond,
    required this.onChangeThirty,
  }) : super(key: key);
  final ValueNotifier<bool> isCheckFirst;
  final ValueNotifier<bool> isCheckSecond;
  final ValueNotifier<bool> isCheckThirty;
  final Function(String) onChangeFirst;
  final Function(String) onChangeSecond;
  final Function(String) onChangeThirty;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: isCheckFirst,
          builder: (context, bool currenCheck, Widget? child) {
            return ItemFilterCheck(
              name: '0đ - 50.000đ',
              valueCheckBox: currenCheck,
              onClicked: (isCheck) {
                if (!isCheck) {
                  isCheckFirst.value = !isCheck;
                  isCheckSecond.value = false;
                  isCheckThirty.value = false;
                  onChangeFirst('0 - 50000');
                } else {
                  isCheckFirst.value = !isCheck;
                  onChangeFirst('');
                }
              },
            );
          },
        ),
        const SizedBox(height: 10.0),
        ValueListenableBuilder(
          valueListenable: isCheckSecond,
          builder: (context, bool currenCheck, Widget? child) {
            return ItemFilterCheck(
              name: '50.000đ - 100.000đ',
              valueCheckBox: currenCheck,
              onClicked: (isCheck) {
                if (!isCheck) {
                  isCheckSecond.value = !isCheck;
                  isCheckFirst.value = false;
                  isCheckThirty.value = false;
                  onChangeSecond('50000 - 100000');
                } else {
                  isCheckSecond.value = !isCheck;
                  onChangeFirst('');
                }
              },
            );
          },
        ),
        const SizedBox(height: 10.0),
        ValueListenableBuilder(
          valueListenable: isCheckThirty,
          builder: (context, bool currenCheck, Widget? child) {
            return ItemFilterCheck(
              name: '100.000đ trở lên',
              valueCheckBox: currenCheck,
              onClicked: (isCheck) {
                if (!isCheck) {
                  isCheckThirty.value = !isCheck;
                  isCheckFirst.value = false;
                  isCheckSecond.value = false;
                  onChangeSecond('100000');
                } else {
                  isCheckThirty.value = !isCheck;
                  onChangeFirst('');
                }
              },
            );
          },
        ),
      ],
    );
  }
}

class ItemFilterCheck extends StatelessWidget {
  final Function(bool) onClicked;
  final bool valueCheckBox;
  final String name;
  const ItemFilterCheck({
    Key? key,
    required this.onClicked,
    required this.valueCheckBox,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CheckBoxWidget(
          value: valueCheckBox,
          width: 20.0,
          height: 20.0,
          onChanged: (isChecked) => onClicked(valueCheckBox),
        ),
        const SizedBox(width: 10.0),
        TextWidgets(
          text: name,
          fontSize: AppDimens.text14,
          textColor: AppColors.darkColor,
        )
      ],
    );
  }
}

class FilterProduct extends StatelessWidget {
  const FilterProduct({super.key, required this.listValueNotifier});
  final List<ValueNotifier<bool>> listValueNotifier;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets(
          text: '*Theo loại sản phẩm',
          fontSize: AppDimens.text14,
          textColor: AppColors.darkColor,
        ),
        const SizedBox(height: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              BlocProvider.of<ProductTypeBloc>(context).state.list.map((e) {
            final list = BlocProvider.of<ProductTypeBloc>(context).state.list;
            final index = list.indexOf(e);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: listValueNotifier[index],
                  builder: (context, bool currentCheck, Widget? child) {
                    return ItemFilterCheck(
                      name: list[index].categ_name,
                      valueCheckBox: currentCheck,
                      onClicked: (isCheck) {
                        listValueNotifier[index].value = !isCheck;

                        context
                            .read<ProductBloc>()
                            .add(AddKeyFilterCateg(list[index].categ_name));
                      },
                    );
                  },
                ),
                index == list.length - 1
                    ? const SizedBox()
                    : const SizedBox(height: 8.0),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
