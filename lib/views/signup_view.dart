import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/widgets/custom_button.dart';
import 'package:sign_up/widgets/custom_dropdown.dart';
import 'package:sign_up/widgets/gradient_appbar.dart';
import 'package:sign_up/widgets/text_field.dart';
import '../constants/field_list.dart';
import '../controllers/signup_controller.dart';
import '../models/input_field.dart';

class MySignUpPageView extends StatefulWidget {
  const MySignUpPageView({Key? key}) : super(key: key);

  @override
  State<MySignUpPageView> createState() => _MySignUpPageViewState();
}

class _MySignUpPageViewState extends State<MySignUpPageView> {
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
                    itemCount: FieldList.fields.length,
                    itemBuilder: (context, index) {
                      switch (FieldList.fields[index].widgetType) {
                        case WidgetType.DropDown:
                          return CustomDropdown(
                            label: FieldList.fields[index].labelName,
                            dropDownList:
                                FieldList.fields[index].dropDownValue!,
                          );
                        case WidgetType.TextField:
                          return CustomTextField(
                            label: FieldList.fields[index].labelName,
                            controller: FieldList.fields[index].controller!,
                            textInputAction: TextInputAction.next,
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
          ],
        ),
      ),
    );
  }
}
