import 'package:flutter/material.dart';

InkWell buildIcon(
    {@required String imageString,
    double height,
    @required BuildContext context,
    @required Function function}) {
  return InkWell(
    child: Image.asset(
      imageString,
      height: height,
      fit: BoxFit.scaleDown,
    ),
    onTap: function,
  );
}
