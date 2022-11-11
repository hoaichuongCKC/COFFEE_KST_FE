import 'package:coffee_kst/app/common/components/item_voucher.dart';
import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/voucher/voucher_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class ListVoucherScreen extends StatelessWidget {
  const ListVoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Danh sách voucher', context: context),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<VoucherHomeBloc, VoucherHomeState>(
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
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.list.length,
                      (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ItemVoucher(entity: state.list[index]),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
