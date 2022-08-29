import 'package:flutter/material.dart';

import '../constants/constants.dart';

class GradientAppbar extends StatelessWidget {
  final String title;
  final double barHeight = 100.0;

  const GradientAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      width: width,
      decoration: linearBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
