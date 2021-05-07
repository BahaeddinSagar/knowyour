import 'package:flutter/material.dart';
import 'package:knowyour/chooseLocation.dart';
import 'package:knowyour/homePage.dart';
import 'package:knowyour/newsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اعرف ناخبك',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: NewsPage.id,
      routes: {
        ChooseLocation.id: (context) => ChooseLocation(),
        HomePage.id: (context) => HomePage(),
        NewsPage.id: (context) => NewsPage()
      },
    );
  }
}
