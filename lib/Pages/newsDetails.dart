import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/models/news_details.dart';

class NewsDetailsPage extends StatefulWidget {
  static const id = 'newsDetails';
  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final newsID = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: APICalls.getNewsDetails(id: newsID.toString()),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            var n = snapshot.data as NewsDetails;
            return Container(
                color: Colors.lightBlue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            n.image,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(children: [
                        Text(
                          n.title,
                          style: TextStyle(fontSize: 30),
                        ),
                        Html(
                          data: n.body,
                        ),
                      ]),
                    ),
                  ],
                ));
          }
        },
      ),
    );
  }
}
