import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/constants/field_lables.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  void Function(String?)? onSaved;

  CustomTextField({
    Key? key,
    required this.label,
    this.keyboardType,
    this.textInputAction,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0)),
          child:
              // String? errorText;
              // switch (label) {
              //   case 'Email':
              //     errorText = formController.errorTextEmail.value;
              //     break;
              //   case 'Referral Code':
              //     errorText = formController.errorTextReferralCode.value;
              //     break;
              //   case 'Mobile Number':
              //     errorText = formController.errorTextMobile.value;
              //     break;
              // }
              TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: onSaved,
            validator: (value) {
              if (label == FieldLabel.mobileFieldLabel &&
                  (value == null || !value.isPhoneNumber)) {
                return 'Please enter phone number';
              }
              if (label == FieldLabel.emailFieldLabel &&
                  (value == null || !value.isEmail)) {
                return 'Please enter email address';
              }
              if (label == FieldLabel.referralFieldLabel &&
                  (value == null || !value.isNumericOnly)) {
                return 'Please enter referral code';
              }
              return null;
            },
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
                hintText: label,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
          ),
        ));
  }
}
