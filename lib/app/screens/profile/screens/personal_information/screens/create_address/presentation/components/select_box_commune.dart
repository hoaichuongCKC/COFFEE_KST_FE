import 'package:coffee_kst/app/common/widgets/selectbox_widget.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/bloc/address_country/address_country_bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/components/overlay_select_box.dart';
import 'package:coffee_kst/main_export.dart';

class SelectBoxCommuneCA extends StatelessWidget {
  SelectBoxCommuneCA({super.key});

  final GlobalKey communeKey = GlobalKey();
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
              text: 'Phường xã',
              fontSize: AppDimens.text18,
              weight: FontWeight.w400,
              textColor: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
            context.watch<AddressCountryBloc>().state.communeEntity.name.isEmpty
                ? const SizedBox()
                : const Icon(Icons.check_circle,
                    size: 15.0, color: Colors.green),
          ],
        ),
        const SizedBox(height: 8.0),
        BlocBuilder<AddressCountryBloc, AddressCountryState>(
          buildWhen: ((previous, current) =>
              previous.communeEntity.name != current.communeEntity.name),
          builder: (context, state) {
            return SelectBoxWidget(
              key: communeKey,
              value: state.communeEntity.name.isEmpty
                  ? 'Chọn phường xã'
                  : state.communeEntity.name,
              onClicked: () {
                context.read<AddressCountryBloc>().add(LoadCommuneEvent());
                OverlaySelectBox.showOverlay(context, communeKey, (p0) {
                  context
                      .read<AddressCountryBloc>()
                      .add(GetCommuneEvent(communeEntity: p0));
                  OverlaySelectBox.dismiss();
                }, LoadCommuneEvent(), link);
              },
            );
          },
        )
      ],
    );
  }
}
