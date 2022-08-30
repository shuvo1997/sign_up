import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/widgets/custom_button.dart';
import 'package:sign_up/widgets/custom_dropdown.dart';
import 'package:sign_up/widgets/gradient_appbar.dart';
import 'package:sign_up/widgets/text_field.dart';
import '../constants/field_lables.dart';
import '../constants/field_list.dart';
import '../controllers/signup_controller.dart';
import '../models/input_field.dart';

class MySignUpPageView extends StatefulWidget {
  const MySignUpPageView({Key? key}) : super(key: key);

  @override
  State<MySignUpPageView> createState() => _MySignUpPageViewState();
}

class _MySignUpPageViewState extends State<MySignUpPageView> {
  List<int> dropDownIntItems = List.generate(10, (index) => index);
  List<String> dropDownStringItems = List.generate(10, (index) => ('$index'));

  List<InputField> rowWidgets = [];

  void printValues() {
    for (var val in fields) {
      print(val.fieldValue);
    }
  }

  // TODO: Save the data
  void onSaved(String? value) {
    for (int i = 0; i < fields.length; i++) {
      fields[i].fieldValue = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    SignUpFormController formController = Get.put(SignUpFormController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GradientAppbar(title: 'Sign Up'),
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 10.0,
              ),
              child: Text('Enter Info for Registration'),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Form(
                key: formController.formKey,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: fields.length,
                    itemBuilder: (context, index) {
                      switch (fields[index].widgetType) {
                        case WidgetType.DropDown:
                          return CustomDropdown(
                              dropDownValues: dropDownStringItems,
                              label: fields[index].labelName);
                        case WidgetType.TextField:
                          return CustomTextField(
                            label: fields[index].labelName,
                            onSaved: onSaved,
                          );
                      }
                    }),
              ),
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: formController.isChecked.value,
                    onChanged: (bool? checked) {
                      formController.onCheckBoxChange(checked);
                    },
                  ),
                ),
                Row(
                  children: const [
                    Text('Please accept  '),
                    Text(
                      'terms',
                      style: TextStyle(color: Colors.pink),
                    ),
                    Text(
                      ' and',
                      // style: TextStyle(color: Colors.pink),
                    ),
                    Text(
                      ' privacy policies',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ],
                ),
              ],
            ),
            const CustomButton(),
            TextButton(onPressed: printValues, child: Text('Print Values')),
          ],
        ),
      ),
    );
  }
}
