import 'package:flutter/material.dart';
import 'package:sign_up/models/input_field.dart';

class CustomRowWidget extends StatelessWidget {
  List<InputField> rowWidgets;
  CustomRowWidget({Key? key, required this.rowWidgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = rowWidgets
        .map((e) => Flexible(
                child: TextField(
              decoration: InputDecoration(hintText: e.labelName),
            )))
        .toList();
    return Row(children: list);
  }
}
