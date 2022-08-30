import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/controllers/signup_controller.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> dropDownList;
  final void Function(String?) onSaved;
  const CustomDropdown({
    Key? key,
    required this.label,
    required this.dropDownList,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpFormController formController = Get.find<SignUpFormController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: DropdownButtonFormField<String>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: formController.dropDownValidation,
        decoration: InputDecoration(
            hintText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        icon: const Icon(Icons.arrow_drop_down),
        items: dropDownList.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String? newValue) {
          print(newValue);
        },
        onSaved: onSaved,
      ),
    );
  }
}
