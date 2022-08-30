enum WidgetType {
  DropDown,
  TextField,
}

class InputField {
  String labelName;
  WidgetType widgetType;
  String? fieldValue;
  List<String>? dropDownValue;
  InputField(
      {required this.labelName,
      required this.widgetType,
      this.fieldValue,
      this.dropDownValue});
}
