import 'package:flutter/material.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/models/news.dart';

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
                          child: buildNewsTile(
                              newsImage: APICalls.baseURL + n.image,
                              newsString: n.title),
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

  Widget buildNewsTile({String newsImage, String newsString}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 18.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
        decoration: BoxDecoration(color: Colors.orange),
        child: Column(
          children: [
            Image.network(
              newsImage,
              fit: BoxFit.fill,
            ),
            Text(newsString)
          ],
        ),
      ),
    );
  }
}
