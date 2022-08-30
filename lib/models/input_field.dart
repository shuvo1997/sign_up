import 'package:flutter/material.dart';

enum WidgetType {
  DropDown,
  TextField,
}

class InputField {
  String labelName;
  WidgetType widgetType;
  String? fieldValue;
  InputField(
      {required this.labelName, required this.widgetType, this.fieldValue});
}
