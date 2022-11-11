import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/main_export.dart';

class EditInforOrderScreen extends StatefulWidget {
  const EditInforOrderScreen({super.key});

  @override
  State<EditInforOrderScreen> createState() => _EditInforOrderScreenState();
}

class _EditInforOrderScreenState extends State<EditInforOrderScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    phoneController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonWidget(
            label: 'Cập nhật',
            onClicked: () {},
          ),
        ),
        appBar: AppBarWidget(title: 'Chỉnh sửa thông tin', context: context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldLabel(
                label: 'Tên người nhận',
                controller: nameController,
                keyboardType: TextInputType.name,
                onChanged: (value) {},
                hintText: '',
                validator: (value) {
                  return 'Không được trống';
                },
              ),
              const SizedBox(height: 12.0),
              TextFormFieldLabel(
                keyboardType: TextInputType.phone,
                label: 'Số điện thoại',
                controller: nameController,
                onChanged: (value) {},
                hintText: '',
                validator: (value) {
                  return 'Không được trống';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
