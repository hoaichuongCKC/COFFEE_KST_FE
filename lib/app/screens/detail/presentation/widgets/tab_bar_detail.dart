import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/app/screens/detail/presentation/components/body_detail.dart';
import 'package:coffee_kst/main_export.dart';

class TabbarDetail extends StatefulWidget {
  const TabbarDetail({Key? key, required this.onChanged}) : super(key: key);
  final Function(TabDetail) onChanged;
  @override
  State<TabbarDetail> createState() => _TabbarDetailState();
}

class _TabbarDetailState extends State<TabbarDetail> {
  final GlobalKey keyDescripton = GlobalKey();
  final GlobalKey keyTopping = GlobalKey();
  final GlobalKey keyRating = GlobalKey();
  ValueNotifier<double> getWidth = ValueNotifier(0);
  ValueNotifier<double> getDx = ValueNotifier(0);
  bool isDescription = false;
  bool isTopping = false;
  bool isRating = false;
  late ProductDetaiServicelBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ProductDetaiServicelBloc>(context);
    bloc.stream.listen((state) {
      if (state.state is ProductDetailLoaded) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _init(keyTopping, isTopping);
          }
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    getWidth.dispose();
    getDx.dispose();
    super.dispose();
  }

  void _init(GlobalKey key, bool ischeck) {
    final box = key.currentContext!.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);
    getWidth.value = box.size.width;
    // 20 - margin of column
    getDx.value = offset.dx - 20;
    ischeck = true;
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 50.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ValueListenableBuilder(
              valueListenable: getDx,
              builder: (context, double currentDx, child) {
                return AnimatedPositioned(
                  bottom: -5.0,
                  left: currentDx,
                  duration: const Duration(milliseconds: 300),
                  child: ValueListenableBuilder(
                      valueListenable: getWidth,
                      builder: (context, double currentWidth, child) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: currentWidth,
                          constraints: const BoxConstraints(
                            maxHeight: 3.0,
                            minHeight: 2.0,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: AppStyles.borderRadius5,
                          ),
                        );
                      }),
                );
              }),
          rowListTab,
        ],
      ),
    );
  }

  Widget get rowListTab =>
      BlocBuilder<ProductDetaiServicelBloc, ProductDetailServiceState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              state.state is ProductDetailLoaded
                  ? GestureDetector(
                      onTap: () {
                        // ngăn người dùng tap nhiều lần
                        if (isDescription) return;
                        _init(keyDescripton, isDescription);
                        widget.onChanged(TabDetail.DESCRIPTION);
                        isRating = false;
                        isTopping = false;
                      },
                      child: TextWidgets(
                        text: 'Mô tả',
                        key: keyDescripton,
                        textColor: AppColors.darkColor,
                      ),
                    )
                  : state.state is ProductDetailLoading
                      ? const SkeletonWidget.rectangle(width: 60.0, height: 8.0)
                      : const SizedBox(),
              const SizedBox(width: 25.0),
              state.state is ProductDetailLoaded
                  ? GestureDetector(
                      onTap: () {
                        if (isTopping) return;
                        _init(keyTopping, isTopping);
                        widget.onChanged(TabDetail.TOPPING);
                        isDescription = false;
                        isRating = false;
                      },
                      child: TextWidgets(
                        text: 'Topping',
                        key: keyTopping,
                        textColor: AppColors.darkColor,
                      ),
                    )
                  : state.state is ProductDetailLoading
                      ? const SkeletonWidget.rectangle(width: 60.0, height: 8.0)
                      : const SizedBox(),
              const SizedBox(width: 25.0),
              state.state is ProductDetailLoaded
                  ? GestureDetector(
                      onTap: () {
                        if (isRating) return;
                        _init(keyRating, isRating);
                        widget.onChanged(TabDetail.RATING);
                        isDescription = false;
                        isTopping = false;
                      },
                      child: TextWidgets(
                        text: 'Đánh giá (${state.data.reviews.length})',
                        key: keyRating,
                        textColor: AppColors.darkColor,
                      ),
                    )
                  : state.state is ProductDetailLoading
                      ? const SkeletonWidget.rectangle(width: 60.0, height: 8.0)
                      : const SizedBox(),
            ],
          );
        },
      );
}
