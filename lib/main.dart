import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:knowyour/Pages/CV.dart';
import 'package:knowyour/Pages/NoInternet.dart';
import 'package:knowyour/Pages/electionProgram.dart';
import 'package:knowyour/Pages/nomineeDetails.dart';

import 'package:knowyour/Pages/nomineeList.dart';
import 'package:knowyour/Pages/chooseLocation.dart';
import 'package:knowyour/Pages/homePage.dart';
import 'package:knowyour/Pages/newsPage.dart';
import 'package:knowyour/Pages/socialMedia.dart';

import 'Pages/mediaPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      initialRoute: HomePage.id,
      routes: {
        ChooseLocation.id: (context) => ChooseLocation(),
        HomePage.id: (context) => HomePage(),
        NewsPage.id: (context) => NewsPage(),
        NomineeListPage.id: (context) => NomineeListPage(),
        CVPage.id: (context) => CVPage(),
        MediaPage.id: (context) => MediaPage(),
        ElectionProgramPage.id: (context) => ElectionProgramPage(),
        NomineeDetails.id: (context) => NomineeDetails(),
        SocialMediaPage.id: (context) => SocialMediaPage(),
        NoInternetPage.id: (context) => NoInternetPage()
      },
    );
  }
}
