import 'package:flutter/material.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/CustomWidgets/buildTile.dart';
import 'package:knowyour/Pages/newsDetails.dart';
import 'package:knowyour/models/news.dart';
import 'package:knowyour/models/news_details.dart';

class NewsPage extends StatelessWidget {
  static const id = "newsPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('الأخبار'),
      ),
      body: Column(
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
            child: FutureBuilder(
              future: APICalls.getnews(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<News> news = snapshot.data;
                  return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.blue,
                          ),
                      itemBuilder: (context, index) {
                        News n = news[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, NewsDetailsPage.id,
                                    arguments: n.id);
                              },
                              child:
                                  buildTile(imageURL: n.image, title: n.title)),
                        );
                      },
                      itemCount: news.length);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // OLD METHOD, to be deleted
  Widget buildNewsTile2({String newsImage, String newsString}) {
    return Container(
      decoration: BoxDecoration(color: Colors.orange),
      child: Column(
        children: [Image.network(newsImage), Text(newsString)],
      ),
    );
  }
}
