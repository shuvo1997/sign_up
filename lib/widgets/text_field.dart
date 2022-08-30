import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/controllers/signup_controller.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String?) onSaved;
  const CustomTextField(
      {Key? key,
      required this.label,
      this.keyboardType,
      this.textInputAction,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpFormController formController = Get.find<SignUpFormController>();
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            return formController.textFieldValidation(value, label);
          },
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSaved: onSaved,
          decoration: InputDecoration(
              hintText: label,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
        ));
  }
}
