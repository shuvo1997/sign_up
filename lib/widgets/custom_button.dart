import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/constants/constants.dart';
import 'package:sign_up/controllers/signup_controller.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    SignUpFormController formController = Get.find<SignUpFormController>();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          var btnFuncVal = formController.submitFunc.value;

          var decoration;
          btnFuncVal == null
              ? decoration = disableDecoration
              : decoration = enableDecoration;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            width: width,
            decoration: decoration,
            child: TextButton(
              onPressed: formController.submitFunc.value,
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }));
  }
}
