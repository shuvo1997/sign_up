import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormController extends GetxController {
  RxString mobileNumber = RxString('');
  RxString email = RxString('');
  RxString referralCode = RxString('');
  RxnString errorTextMobile = RxnString(null);
  RxnString errorTextEmail = RxnString(null);
  RxnString errorTextReferralCode = RxnString(null);

  RxBool doneMobile = RxBool(false);
  RxBool doneEmail = RxBool(false);
  RxBool doneReferral = RxBool(false);

  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  RxBool isChecked = RxBool(false);

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    debounce<String>(mobileNumber, mobileValidations,
        time: const Duration(milliseconds: 500));
    debounce<String>(email, emailValidations,
        time: const Duration(milliseconds: 500));
    debounce<String>(referralCode, referralValidations,
        time: const Duration(milliseconds: 500));
    debounce<bool>(doneReferral, buttonValidation,
        time: const Duration(milliseconds: 500));
    debounce<bool>(doneEmail, buttonValidation,
        time: const Duration(milliseconds: 500));
    debounce<bool>(doneMobile, buttonValidation,
        time: const Duration(milliseconds: 500));
  }

  void buttonValidation(bool val) {
    if (doneMobile.value && doneEmail.value && doneReferral.value) {
      submitFunc.value = submitFunction();
    }
  }

  void mobileValidations(String val) {
    errorTextMobile.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      if (mobileLengthOk(val)) {
        errorTextMobile.value = null;
        doneMobile.value = true;
      }
    }
  }

  bool mobileLengthOk(String val, {int minVal = 11}) {
    if (val.length < minVal) {
      errorTextMobile.value = 'length is less than 11';
      return false;
    }
    return true;
  }

  void emailValidations(String val) {
    errorTextEmail.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      if (emailOk(val)) {
        errorTextEmail.value = null;
        doneEmail.value = true;
      }
    }
  }

  bool emailOk(String val) {
    if (!GetUtils.isEmail(val)) {
      errorTextEmail.value = 'it is not email';
      return false;
    }
    return true;
  }

  void referralValidations(String val) {
    errorTextReferralCode.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      if (referralLengthOk(val)) {
        errorTextReferralCode.value = null;
        doneReferral.value = true;
      }
    }
  }

  bool referralLengthOk(String val, {int minVal = 5}) {
    if (val.length < minVal) {
      errorTextReferralCode.value = 'length is less than 5';
      return false;
    }
    return true;
  }

  Function() submitFunction() {
    return () {
      print('Mobile Number: ${mobileNumber.value}');
      print('Email: ${email.value}');
      print('Referral Code: ${referralCode.value}');
      return true;
    };
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

  void widgetChanged(String val, String label) {
    if (label == 'Email') {
      email.value = val;
    } else if (label == 'Referral Code') {
      referralCode.value = val;
    } else {
      mobileNumber.value = val;
    }
  }
}
