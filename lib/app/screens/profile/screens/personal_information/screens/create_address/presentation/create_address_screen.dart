import 'package:coffee_kst/main_export.dart';
import 'components/body_create_address.dart';

class CreateAddressScreen extends StatelessWidget {
  const CreateAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const BodyCreateAddress(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: InkWell(
        onTap: () => context.pop(),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20.0,
          color: AppColors.lightColor,
        ),
      ),
      title: TextWidgets(
        text: "Tạo địa chỉ mới",
        fontSize: AppDimens.text22,
        weight: FontWeight.w600,
      ),
    );
  }
}
