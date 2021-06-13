import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:knowyour/models/c_v.dart';

import '../APICalls.dart';
import '../models/nominee.dart';

class CVPage extends StatelessWidget {
  static const id = "CVPage";
  @override
  Widget build(BuildContext context) {
    final nominee = ModalRoute.of(context).settings.arguments as Nominee;
    print(nominee);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LimitedBox(
                    maxHeight: 200,
                    maxWidth: 200,
                    child: Image.network(nominee.profilePicture)),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [Text(nominee.name), Text(nominee.region)],
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Center(
                child: FutureBuilder(
                  future: APICalls.getCV(id: nominee.id.toString()),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      var data = snapshot.data as CV;
                      return Html(
                        data: data.cv,
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
