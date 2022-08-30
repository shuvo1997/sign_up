import 'package:flutter/material.dart';

enum WidgetType {
  DropDown,
  TextField,
}

class InputField {
  String labelName;
  WidgetType widgetType;
  String? fieldValue;
  TextEditingController? controller;
  List<String>? dropDownValue;
  InputField(
      {required this.labelName,
      required this.widgetType,
      this.fieldValue,
      this.controller,
      this.dropDownValue});
}
