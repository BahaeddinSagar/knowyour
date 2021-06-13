import 'package:flutter/material.dart';

InkWell buildIcon(
    {@required String imageString,
    @required BuildContext context,
    @required Function function}) {
  return InkWell(
    child: Image.asset(
      imageString,
      fit: BoxFit.fill,
    ),
    onTap: function,
  );
}
