import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/Pages/nomineeDetails.dart';

import 'package:knowyour/Pages/nomineeList.dart';
import 'package:knowyour/Pages/newsPage.dart';
import 'package:knowyour/models/ad.dart';
import 'package:knowyour/models/nominee.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../CustomWidgets/BuildIcon.dart';
import 'NoInternet.dart';

class HomePage extends StatefulWidget {
  static const id = "homePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    // Check to see if Android Location permissions are enabled
    // Described in https://github.com/flutter/flutter/issues/51529
    if (Platform.isAndroid) {
      print('Checking Android permissions');
      var status = await Permission.location.status;
      // Blocked?
      if (status.isDenied || status.isRestricted) {
        // Ask the user to unblock
        if (await Permission.location.request().isGranted) {
          // Either the permission was already granted before or the user just granted it.
          print('Location permission granted');
        } else {
          print('Location permission not granted');
        }
      } else {
        print('Permission already granted (previous execution?)');
      }
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
        print('Failed to get connectivity.');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "الصفحة الرئيسية",
          ),
        ),
        body: Container(
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: FutureBuilder(
                    future: APICalls.getAds(),
                    builder: (context, snapshot) {
                      print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return Center(child: Text("لا يوجد اتصال بالانترنت"));
                      } else {
                        List<Ad> ads = snapshot.data;
                        return ImageSlideshow(
                          width: double.infinity,
                          indicatorColor: Colors.blue,
                          indicatorBackgroundColor: Colors.grey,
                          children: ads.map((ad) {
                            return InkWell(
                                onTap: () {
                                  openURL(ad.url);
                                },
                                child: Image.network(
                                  ad.image,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ));
                          }).toList(),
                        );
                      }
                    }),
              ),
              Divider(
                color: Colors.orange,
                thickness: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: GroupButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openURL(String url) {
    if (url.length < 10) {
      //needs to be dynamic
      Navigator.pushNamed(context, NomineeDetails.id,
          arguments: Nominee(
              id: 1,
              name: "محمد المختار",
              region: "طرابلس المركز",
              profilePicture: "/media/images/nominees/Asset_71ldpi.png",
              updatedAt: "2021-05-24T22:57:24.488097+02:00"));
    } else {
      if (canLaunch(url) != null)
        launch(url);
      else
        throw "Could not launch $url";
    }
  }
}

class GroupButtons extends StatelessWidget {
  final buttonHeight = 150.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIcon(
                imageString: 'assets/images/candidateIcon.png',
                height: buttonHeight,
                function: () {
                  Navigator.pushNamed(context, NomineeListPage.id);
                },
                context: context),
            buildIcon(
                imageString: 'assets/images/resultsIcon.png',
                height: buttonHeight,
                context: context,
                function: () {
                  Navigator.pushNamed(context, NomineeListPage.id);
                })
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIcon(
                imageString: 'assets/images/newsIcon.png',
                height: buttonHeight,
                context: context,
                function: () {
                  Navigator.pushNamed(context, NewsPage.id);
                }),
            buildIcon(
                imageString: 'assets/images/mapIcon.png',
                height: buttonHeight,
                context: context,
                function: () {
                  Navigator.pushNamed(context, NomineeListPage.id);
                }),
          ],
        )
      ],
    );
  }
}
