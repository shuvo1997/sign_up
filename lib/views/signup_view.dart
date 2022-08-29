import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/widgets/custom_button.dart';
import 'package:sign_up/widgets/custom_dropdown.dart';
import 'package:sign_up/widgets/gradient_appbar.dart';
import 'package:sign_up/widgets/text_field.dart';
import '../controllers/signup_controller.dart';
import '../models/input_field.dart';

class MySignUpPageView extends StatefulWidget {
  const MySignUpPageView({Key? key}) : super(key: key);

  @override
  State<MySignUpPageView> createState() => _MySignUpPageViewState();
}

class _MySignUpPageViewState extends State<MySignUpPageView> {
  List<InputField> fields = [
    InputField(
        labelName: 'Select Nationality', widgetType: WidgetType.DropDown),
    InputField(labelName: 'Select Country', widgetType: WidgetType.DropDown),
    InputField(
        labelName: 'Mobile Number',
        widgetType: WidgetType.TextField,
        controller: TextEditingController()),
    InputField(labelName: 'ID Type', widgetType: WidgetType.DropDown),
    InputField(labelName: 'Email', widgetType: WidgetType.TextField),
    InputField(labelName: 'Referral Code', widgetType: WidgetType.TextField),
  ];

  List<int> dropDownIntItems = List.generate(10, (index) => index);
  List<String> dropDownStringItems = List.generate(10, (index) => ('$index'));

  List<InputField> rowWidgets = [];

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
            const CustomButton()
          ],
        ),
      ),
    );
  }
}
