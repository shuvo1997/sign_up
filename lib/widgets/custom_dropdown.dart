import 'package:flutter/material.dart';
import 'package:sign_up/constants/field_list.dart';

class CustomDropdown extends StatefulWidget {
  String label;
  List<String> dropDownList;
  CustomDropdown({Key? key, required this.label, required this.dropDownList})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // List<int> dropDownIntValues;
  // List<String> dropDownStringValues;
  //
  // checkClassType<T>(List<T> list){
  //   if(T == String){
  //     dropDownIntValues = widget.dropDownValues;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String dropDownValue = widget.dropDownList.first;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            hintText: widget.label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        icon: const Icon(Icons.arrow_drop_down),
        items: widget.dropDownList.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },
      ),
    );
  }
}
