import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/models/nominee.dart';
import 'package:knowyour/models/program.dart';

class ElectionProgramPage extends StatelessWidget {
  static const id = "Program";

  @override
  Widget build(BuildContext context) {
    final nominee = ModalRoute.of(context).settings.arguments as Nominee;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              child: Center(
                child: FutureBuilder(
                  future: APICalls.getProgram(id: nominee.id.toString()),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      var data = snapshot.data as Program;
                      return Html(
                        data: data.program,
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
