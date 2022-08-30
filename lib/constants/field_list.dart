import '../models/input_field.dart';
import 'field_lables.dart';

class FieldList {
  static List<String> nationalityDropDown = [
    'Bangladeshi',
    'Indian',
    'American'
  ];
  static List<String> countryCodeDropDown = ['BD +880', 'IN +91', 'USA +1'];

  static List<String> idType = ['National ID', 'Birth Certificate '];
  static List<InputField> fields = [
    InputField(
        labelName: FieldLabel.nationalityFieldLabel,
        widgetType: WidgetType.DropDown,
        dropDownValue: nationalityDropDown),
    InputField(
        labelName: FieldLabel.countryFieldLabel,
        widgetType: WidgetType.DropDown,
        dropDownValue: countryCodeDropDown),
    InputField(
      labelName: FieldLabel.mobileFieldLabel,
      widgetType: WidgetType.TextField,
    ),
    InputField(
        labelName: FieldLabel.idFieldLabel,
        widgetType: WidgetType.DropDown,
        dropDownValue: idType),
    InputField(
      labelName: FieldLabel.emailFieldLabel,
      widgetType: WidgetType.TextField,
    ),
    InputField(
      labelName: FieldLabel.referralFieldLabel,
      widgetType: WidgetType.TextField,
    ),
  ];

  static void printValues() {
    for (var value in fields) {
      print(value.fieldValue);
    }
  }
}
