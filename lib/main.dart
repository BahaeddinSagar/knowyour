import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:knowyour/nomineeDetails.dart';

import 'package:knowyour/nomineeList.dart';
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
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('ar', '')],
      locale: Locale('ar', ''),
      title: 'اعرف ناخبك',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: NewsPage.id,
      routes: {
        ChooseLocation.id: (context) => ChooseLocation(),
        HomePage.id: (context) => HomePage(),
        NewsPage.id: (context) => NewsPage(),
        NomineeListPage.id: (context) => NomineeListPage(),
        NomineeDetails.id: (context) => NomineeDetails()
      },
    );
  }
}
