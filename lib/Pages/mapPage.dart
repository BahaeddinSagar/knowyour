import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  static const id = "MapPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('المناطق الانتخابية'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Flexible(
          child: Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/newsImage.png'),
            ),
          ),
          flex: 1,
        ),
        Flexible(
          flex: 5,
          child: Center(child: Image.asset('assets/images/libyasprite.png')),
        )
      ]),
    );
  }
}
