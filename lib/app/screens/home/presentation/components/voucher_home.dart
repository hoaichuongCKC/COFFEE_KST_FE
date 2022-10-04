import 'package:coffee_kst/app/common/animations/do_fade/fade_in.dart';
import 'package:coffee_kst/app/common/components/item_voucher.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/voucher/voucher_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/title_home.dart';
import 'package:coffee_kst/main_export.dart';

class VoucherHome extends StatelessWidget {
  const VoucherHome({Key? key}) : super(key: key);

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
              child: TitleHomeWidget(label: 'Khuyến mãi', onTrailing: () {}),
            ),
            const SizedBox(height: 8.0),
            LimitedBox(
              maxHeight: 100.0,
              child: BlocBuilder<VoucherHomeBloc, VoucherHomeState>(
                builder: (context, state) {
                  if (state is VoucherLoading) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: const [
                          SkeletonWidget.rectangle(
                            width: 280.0,
                            height: 100.0,
                            borderRadius: RoundedRectangleBorder(
                              borderRadius: AppStyles.borderRadius12,
                            ),
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    );
                  }
                  if (state is VoucherLoadFailed) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Stack(
                        children: [
                          TextWidgets(
                            text: state.message,
                            maxline: 3,
                            fontSize: AppDimens.text14,
                            textColor: AppColors.textErrorColor,
                          ),
                          const SizedBox(height: 8.0),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () => context
                                  .read<VoucherHomeBloc>()
                                  .add(LoadVoucherEvent()),
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
                  if (state is VoucherLoaded) {
                    return FadeIn(
                      delay: const Duration(milliseconds: 100),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.length + 1,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 0.0),
                        itemBuilder: (context, index) {
                          final list = state.list;
                          if (index + 1 == state.list.length + 1) {
                            return viewMore;
                          }
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 15.0,
                                right: index == state.list.length - 1
                                    ? 15.0
                                    : 0.0),
                            child: ItemVoucher(
                                key: PageStorageKey(list[index].id),
                                entity: list[index]),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell get viewMore {
    return InkWell(
      onTap: () {},
      borderRadius: AppStyles.borderRadius12,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidgets(
            text: 'Xem tiếp',
            textColor: AppColors.primaryColor,
            weight: FontWeight.w500,
          ),
          SvgPicture.asset(
            AppIcons.ARROW_RIGHT_ASSET,
            color: AppColors.primaryColor,
          ),
          SvgPicture.asset(
            AppIcons.ARROW_RIGHT_ASSET,
            color: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
