import 'package:coffee_kst/app/common/widgets/selectbox_widget.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/bloc/address_country/address_country_bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/components/overlay_select_box.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectBoxDistrictCA extends StatelessWidget {
  SelectBoxDistrictCA({super.key});

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
              text: LocaleKeys.district.tr(),
              fontSize: AppDimens.text18,
              weight: FontWeight.w400,
              textColor: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
            context
                    .watch<AddressCountryBloc>()
                    .state
                    .districtEntity
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
              previous.districtEntity.name != current.districtEntity.name),
          builder: (context, state) {
            return SelectBoxWidget(
              key: provinceKey,
              value: state.districtEntity.name.isEmpty
                  ? 'Chọn quận huyện'
                  : state.districtEntity.name,
              onClicked: () {
                context.read<AddressCountryBloc>().add(LoadDistrictEvent());
                OverlaySelectBox.showOverlay(context, provinceKey, (p0) {
                  context
                      .read<AddressCountryBloc>()
                      .add(GetDictrictEvent(districtEntity: p0));
                  OverlaySelectBox.dismiss();
                }, LoadDistrictEvent(), link);
              },
            );
          },
        )
      ],
    );
  }
}
