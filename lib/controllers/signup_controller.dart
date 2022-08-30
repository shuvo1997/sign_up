import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/field_lables.dart';

class SignUpFormController extends GetxController {
  RxBool isChecked = RxBool(false);

  final formKey = GlobalKey<FormState>();

  String? dropDownValidation(String? value) {
    if (value == null) {
      return 'Please select a value';
    }
    return null;
  }

  String? textFieldValidation(String? value, String label) {
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
