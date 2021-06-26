import 'package:flutter/material.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key key}) : super(key: key);
  static const id = 'newsDetails';
  final newsID = ModalRoute.of(context).settings.arguments as int;

  @override
  Widget build(BuildContext context) {
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
                  future: APICalls.getNewsDetail(id: newsID.tostring()),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      var data = snapshot.data as NewsDetail;
                      return Html(
                        data: data.description,
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
