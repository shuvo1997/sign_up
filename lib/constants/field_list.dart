import '../models/input_field.dart';
import 'field_lables.dart';

List<InputField> fields = [
  InputField(labelName: 'Select Nationality', widgetType: WidgetType.DropDown),
  InputField(labelName: 'Select Country', widgetType: WidgetType.DropDown),
  InputField(
    labelName: FieldLabel.mobileFieldLabel,
    widgetType: WidgetType.TextField,
  ),
  InputField(labelName: 'ID Type', widgetType: WidgetType.DropDown),
  InputField(
      labelName: FieldLabel.emailFieldLabel, widgetType: WidgetType.TextField),
  InputField(
      labelName: FieldLabel.referralFieldLabel,
      widgetType: WidgetType.TextField),
];
