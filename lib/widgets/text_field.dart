import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/controllers/signup_controller.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;

  CustomTextField({
    Key? key,
    required this.label,
    this.keyboardType,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpFormController formController = Get.find<SignUpFormController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0)),
          child: Obx(() {
            String? errorText;
            switch (label) {
              case 'Email':
                errorText = formController.errorTextEmail.value;
                break;
              case 'Referral Code':
                errorText = formController.errorTextReferralCode.value;
                break;
              case 'Mobile Number':
                errorText = formController.errorTextMobile.value;
                break;
            }
            return TextField(
              onChanged: (String val) {
                formController.widgetChanged(val, label);
              },
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              decoration: InputDecoration(
                  hintText: label,
                  errorText: errorText,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
            );
          })),
    );
  }
}
