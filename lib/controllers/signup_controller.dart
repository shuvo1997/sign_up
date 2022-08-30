import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormController extends GetxController {
  RxBool isChecked = RxBool(false);

  final formKey = GlobalKey<FormState>();

  String? dropDownValidation(String? value) {
    if (value == null) {
      return 'Please select a value';
    }
    return null;
  }

  onCheckBoxChange(bool? checked) {
    if (checked != null) {
      if (checked) {
        isChecked.value = true;
      } else {
        isChecked.value = false;
      }
    }
  }
}
