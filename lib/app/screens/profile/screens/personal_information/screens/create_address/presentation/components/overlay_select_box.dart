import 'package:coffee_kst/app/common/widgets/text_form_widget.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/bloc/address_country/address_country_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class OverlaySelectBox {
  static OverlayEntry? _overlayEntry;
  static bool isVisible = false;
  static void showOverlay(
    BuildContext context,
    GlobalKey key,
    Function(dynamic) onClicked,
    AddressCountryEvent event,
    LayerLink layerLink,
  ) async {
    if (isVisible) {
      dismiss();
      return;
    }
    OverlaySelectBox._createViewProvince(
        context, key, onClicked, event, layerLink);
  }

  static dismiss() {
    if (isVisible) {
      isVisible = false;
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static void _createViewProvince(
    BuildContext context,
    GlobalKey key,
    Function(dynamic) onClicked,
    AddressCountryEvent event,
    LayerLink layerLink,
  ) async {
    var overlayState = Overlay.of(context);
    final box = key.currentContext!.findRenderObject() as RenderBox;
    final size = box.localToGlobal(Offset.zero);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => OverlayAddress(
        overlayEntry: _overlayEntry!,
        offset: size,
        heightOffset: box.size.height,
        onClicked: onClicked,
        event: event,
        layerLink: layerLink,
      ),
    );
    isVisible = true;
    overlayState?.insert(_overlayEntry!);
  }
}

class OverlayAddress extends StatefulWidget {
  const OverlayAddress({
    Key? key,
    required this.overlayEntry,
    required this.offset,
    required this.heightOffset,
    required this.onClicked,
    required this.event,
    required this.layerLink,
  }) : super(key: key);

  final OverlayEntry overlayEntry;
  final double heightOffset;
  final Offset offset;
  final AddressCountryEvent event;
  final Function(dynamic) onClicked;
  final LayerLink layerLink;
  @override
  // ignore: library_private_types_in_public_api
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<OverlayAddress> {
  Offset get myOffset => widget.offset;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: myOffset.dy + widget.heightOffset + 10,
      left: myOffset.dx,
      right: myOffset.dx,
      child: FadeInDown(
        duration: const Duration(milliseconds: 200),
        from: 20,
        child: CompositedTransformFollower(
          // showWhenUnlinked: false,
          offset: Offset(0, widget.heightOffset + 10),
          link: widget.layerLink,
          child: Container(
            width: size.width,
            height: widget.event == LoadCommuneEvent()
                ? size.height * 0.4
                : size.height * 0.6,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.darkColor
                  : AppColors.lightColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget get child => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              TextWidgets(
                text: widget.event == LoadProvinceEvent()
                    ? 'Danh sách tỉnh/thành phố'
                    : widget.event == LoadDistrictEvent()
                        ? 'Danh sách quận/huyện'
                        : 'Danh sách phường xã',
                fontSize: AppDimens.text16,
                textColor: Theme.of(context).primaryColor,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => OverlaySelectBox.dismiss(),
                child: Icon(
                  Icons.clear,
                  size: 20.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<AddressCountryBloc, AddressCountryState>(
              builder: (context, state) {
                if (state.state is DataAddressLoading) {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15.0),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SkeletonWidget.rectangle(
                            width: 150,
                            height: 25,
                            borderRadius: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                          SizedBox(height: 15.0),
                          SkeletonWidget.rectangle(
                            width: double.maxFinite,
                            height: 1.0,
                            borderRadius: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1.0))),
                          ),
                        ],
                      );
                    },
                  );
                }
                if (state.state is DataAddressFailed) {
                  return TextWidgets(
                    text: state.message,
                    fontSize: AppDimens.text14,
                  );
                }
                if (state.state is DataAddressLoaded) {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15.0),
                    itemCount: widget.event == LoadProvinceEvent()
                        ? state.listProvince.length
                        : widget.event == LoadDistrictEvent()
                            ? state.listDistrict.length
                            : state.listCommune.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            widget.onClicked(widget.event == LoadProvinceEvent()
                                ? state.listProvince[index]
                                : widget.event == LoadDistrictEvent()
                                    ? state.listDistrict[index]
                                    : state.listCommune[index]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidgets(
                              text: widget.event == LoadProvinceEvent()
                                  ? state.listProvince[index].name
                                  : widget.event == LoadDistrictEvent()
                                      ? state.listDistrict[index].name
                                      : state.listCommune[index].name,
                              textColor: AppColors.disableTextColor,
                            ),
                            const Divider(color: AppColors.disableTextColor)
                          ],
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      );
}
