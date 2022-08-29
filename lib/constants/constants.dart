import 'package:flutter/material.dart';

import 'colors.dart';

var linearBoxDecoration = const BoxDecoration(
    gradient: LinearGradient(
  colors: [
    CustomColors.gradientColor1,
    CustomColors.gradientColor2,
    CustomColors.gradientColor3
  ],
));

var textStyle = const TextStyle(fontSize: 20, color: Colors.white);

var enableDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      colors: [
        CustomColors.gradientColor1,
        CustomColors.gradientColor2,
        CustomColors.gradientColor3
      ],
    ));
var disableDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: Colors.grey,
);
