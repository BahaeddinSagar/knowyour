import 'package:flutter/material.dart';

InkWell buildIcon(
    {@required String imageString,
    double height,
    @required BuildContext context,
    @required Function function}) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imageString,
        height: height,
        fit: BoxFit.scaleDown,
      ),
    ),
    onTap: function,
  );
}
