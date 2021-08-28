import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/models/news.dart';
import 'package:knowyour/models/news_details.dart';

class NewsDetailsPage extends StatefulWidget {
  static const id = 'newsDetails';
  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context).settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        color: Colors.lightBlue,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'testing',
                    child: Image.network(
                      news.image,
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                  future: APICalls.getNewsDetails(id: news.id.toString()),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      var n = snapshot.data as NewsDetails;
                      return Column(children: [
                        Text(
                          n.title,
                          style: TextStyle(fontSize: 30),
                        ),
                        Html(
                          data: n.body,
                        ),
                      ]);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
