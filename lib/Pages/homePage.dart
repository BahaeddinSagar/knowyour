import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:knowyour/Pages/nomineeList.dart';
import 'package:knowyour/Pages/newsPage.dart';

import '../CustomWidgets/BuildIcon.dart';
import 'NoInternet.dart';

class HomePage extends StatefulWidget {
  static const id = "homePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    print(result.toString());
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        Navigator.pushReplacementNamed(context, NoInternetPage.id);
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
/*      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/page3Background-LOW.png'),
          fit: BoxFit.fill,
        ),
      ),
      */
      child: Scaffold(
        appBar: AppBar(
          title: Text("الصفحة الرئيسية"),
        ),
        body: Container(
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 40,
                child: Image.asset(
                  'assets/images/newsSample.png',
                  fit: BoxFit.fill,
                ),
              ),
              Divider(
                color: Colors.orange,
                thickness: 10,
              ),
              Flexible(
                flex: 40,
                child: GroupButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupButtons extends StatelessWidget {
  const GroupButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: buildIcon(
                  imageString: 'assets/images/candidateIcon.png',
                  function: () {
                    Navigator.pushNamed(context, NomineeListPage.id);
                  },
                  context: context),
              flex: 4,
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: buildIcon(
                  imageString: 'assets/images/resultsIcon.png',
                  context: context,
                  function: () {
                    Navigator.pushNamed(context, NomineeListPage.id);
                  }),
              flex: 4,
            )
          ],
        ),
        Column(
          children: [
            Expanded(
              child: buildIcon(
                  imageString: 'assets/images/newsIcon.png',
                  context: context,
                  function: () {
                    Navigator.pushNamed(context, NewsPage.id);
                  }),
              flex: 4,
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: buildIcon(
                  imageString: 'assets/images/mapIcon.png',
                  context: context,
                  function: () {
                    Navigator.pushNamed(context, NomineeListPage.id);
                  }),
              flex: 4,
            ),
          ],
        )
      ],
    );
  }
}
