import 'package:coffee_kst/app/common/widgets/selectbox_widget.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/components/overlay_select_box.dart';
import 'package:coffee_kst/main_export.dart';

import '../bloc/address_country/address_country_bloc.dart';

class SelectBoxProvinceCA extends StatelessWidget {
  SelectBoxProvinceCA({super.key});

  final GlobalKey provinceKey = GlobalKey();
  final LayerLink link = LayerLink();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidgets(
              text: 'Tỉnh thành phố',
              fontSize: AppDimens.text18,
              weight: FontWeight.w400,
              textColor: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
            context
                    .watch<AddressCountryBloc>()
                    .state
                    .provinceEntity
                    .name
                    .isEmpty
                ? const SizedBox()
                : const Icon(Icons.check_circle,
                    size: 15.0, color: Colors.green),
          ],
        ),
        const SizedBox(height: 8.0),
        BlocBuilder<AddressCountryBloc, AddressCountryState>(
          buildWhen: ((previous, current) =>
              previous.provinceEntity.name != current.provinceEntity.name),
          builder: (context, state) {
            return CompositedTransformTarget(
              link: link,
              child: SelectBoxWidget(
                key: provinceKey,
                value: state.provinceEntity.name.isEmpty
                    ? 'Chọn tỉnh thành phố'
                    : state.provinceEntity.name,
                onClicked: () {
                  context.read<AddressCountryBloc>().add(LoadProvinceEvent());
                  OverlaySelectBox.showOverlay(context, provinceKey, (p0) {
                    context
                        .read<AddressCountryBloc>()
                        .add(GetProvinceEvent(provinceEntity: p0));
                    OverlaySelectBox.dismiss();
                  }, LoadProvinceEvent(), link);
                },
              ),
            );
          },
        )
      ],
    );
  }

  Widget get skeleton {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SkeletonWidget.rectangle(
          width: 150,
          height: 25,
          borderRadius: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
        SizedBox(height: 15.0),
        SkeletonWidget.rectangle(
          width: double.maxFinite,
          height: 1.0,
          borderRadius: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
        ),
      ],
    );
  }
}
