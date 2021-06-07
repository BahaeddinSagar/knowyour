import 'package:flutter/material.dart';

import 'models/nominee.dart';

class NomineeDetails extends StatelessWidget {
  Nominee nominee;
  NomineeDetails({this.nominee});
  static const id = "NomineeDetails";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Card(
                child: Column(
                  children: [Image.network(nominee.profilePicture)],
                ),
              ))
        ],
      ),
    );
  }
}
