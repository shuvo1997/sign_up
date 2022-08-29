import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  String label;
  List<String> dropDownValues;
  CustomDropdown({Key? key, required this.dropDownValues, required this.label})
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
  CustomDropdown get widget => super.widget;
  String dropDownValue = '1';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          value: dropDownValue,
          icon: const Icon(Icons.arrow_drop_down),
          items: widget.dropDownValues.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropDownValue = newValue!;
            });
          },
        )),
      ),
    );
  }
}
