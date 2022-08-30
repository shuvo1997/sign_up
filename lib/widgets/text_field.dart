import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/constants/field_lables.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  void Function(String?) onSaved;
  CustomTextField(
      {Key? key,
      required this.label,
      this.keyboardType,
      this.textInputAction,
      required this.onSaved})
      : super(key: key);

  // void saveData() {
  //   if (label == FieldLabel.mobileFieldLabel) {
  //     for (var element in FieldList.fields) {
  //       if (element.labelName == label) {
  //         element.fieldValue = controller.text;
  //       }
  //     }
  //     // FieldList.fields[2].fieldValue = controller.text;
  //   }
  //   if (label == FieldLabel.emailFieldLabel) {
  //     for (var element in FieldList.fields) {
  //       if (element.labelName == label) {
  //         element.fieldValue = controller.text;
  //       }
  //     }
  //   }
  //   if (label == FieldLabel.referralFieldLabel) {
  //     for (var element in FieldList.fields) {
  //       if (element.labelName == label) {
  //         element.fieldValue = controller.text;
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
