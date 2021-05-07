import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  static String id = "ChooseLocation";
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اعرف ناخبك"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('اختر الدائرة الانتخابية'),
            DropdownButtonFormField(onChanged: null, items: <DropdownMenuItem>[
              DropdownMenuItem(value: 1, child: Text("123"))
            ])
          ],
        ),
      ),
    );
  }
}
