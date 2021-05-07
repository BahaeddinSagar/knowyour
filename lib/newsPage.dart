import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  static String id = "newsPage";
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
            child: ListView(
              children: [
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
                buildNewsTile(
                    newsImage: 'assets/images/newsSample.png',
                    newsString:
                        'فتح باب التسجيل للمترشحين من قبل المفوضية العليا للأنتخابات'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNewsTile({String newsImage, String newsString}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.orange),
      child: Column(
        children: [Image.asset(newsImage), Text(newsString)],
      ),
    );
  }
}
