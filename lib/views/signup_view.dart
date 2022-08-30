import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/widgets/custom_button.dart';
import 'package:sign_up/widgets/custom_dropdown.dart';
import 'package:sign_up/widgets/text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/field_list.dart';
import '../controllers/signup_controller.dart';
import '../models/input_field.dart';
import '../constants/constants.dart';

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
      appBar: AppBar(
        titleSpacing: 30,
        leading: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Icon(Icons.arrow_back_ios),
        ),
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text('Sign Up'),
        ),
        flexibleSpace: Container(
          decoration: linearBoxDecoration,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text('Enter Info for Registration'),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Form(
                key: formController.formKey,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: FieldList.fields.length,
                    itemBuilder: (context, index) {
                      switch (FieldList.fields[index].widgetType) {
                        case WidgetType.DropDown:
                          return CustomDropdown(
                            label: FieldList.fields[index].labelName,
                            dropDownList:
                                FieldList.fields[index].dropDownValue!,
                            onSaved: (String? val) {
                              FieldList.fields[index].fieldValue = val;
                            },
                          );
                        case WidgetType.TextField:
                          return CustomTextField(
                            label: FieldList.fields[index].labelName,
                            textInputAction: TextInputAction.next,
                            onSaved: (String? val) {
                              FieldList.fields[index].fieldValue = val;
                            },
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
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Please accept ',
                        style: TextStyle(color: Colors.black),
                      ),
                      const TextSpan(
                        text: 'terms',
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: ' and',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: ' privacy policies',
                        style: const TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            String url = 'https://blog.logrocket.com';
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalApplication);
                          },
                      ),
                    ],
                  ),
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
