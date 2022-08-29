import 'package:flutter/material.dart';

enum WidgetType {
  DropDown,
  TextField,
}

class InputField {
  String labelName;
  WidgetType widgetType;
  TextEditingController? controller = TextEditingController(text: "");

  InputField(
      {required this.labelName, required this.widgetType, this.controller});
}
