import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/constants/constants.dart';
import 'package:sign_up/constants/field_list.dart';
import 'package:sign_up/controllers/signup_controller.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    SignUpFormController formController = Get.find<SignUpFormController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: width,
        decoration: enableDecoration,
        child: TextButton(
          onPressed: () {
            final isValid = formController.formKey.currentState!.validate();
            if (!isValid) {
              return;
            }
            formController.formKey.currentState!.save();
            FieldList.printValues();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Data Saved')),
            );
          },
          child: const Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
