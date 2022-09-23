import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/components/form_specific_address.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/components/select_box_commune.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/components/select_box_district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/components/select_box_province.dart';
import 'package:coffee_kst/main_export.dart';

class BodyCreateAddress extends StatelessWidget {
  const BodyCreateAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectBoxProvinceCA(),
            const SizedBox(height: 15.0),
            SelectBoxDistrictCA(),
            const SizedBox(height: 15.0),
            SelectBoxCommuneCA(),
            const SizedBox(height: 15.0),
            const FormSpecificAddress(),
          ],
        ),
      ),
    );
  }
}
