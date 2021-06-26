import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:knowyour/CustomWidgets/BuildIcon.dart';
import 'package:knowyour/Pages/CV.dart';
import 'package:knowyour/Pages/electionProgram.dart';
import 'package:knowyour/Pages/mediaPage.dart';
import 'package:knowyour/Pages/socialMedia.dart';

import '../models/nominee.dart';

class NomineeDetails extends StatelessWidget {
  static const id = "NomineeDetails";
  @override
  Widget build(BuildContext context) {
    final nominee = ModalRoute.of(context).settings.arguments as Nominee;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 18.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        nominee.profilePicture,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                      Text('مرشح عن دائرة' + nominee.region)
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildIcon(
                              imageString: 'assets/images/CVIcon.png',
                              height: 100,
                              context: context,
                              function: () {
                                print(nominee);
                                Navigator.pushNamed(context, CVPage.id,
                                    arguments: nominee);
                              }),
                          buildIcon(
                              imageString: 'assets/images/programIcon.png',
                              height: 100,
                              context: context,
                              function: () {
                                Navigator.pushNamed(
                                    context, ElectionProgramPage.id,
                                    arguments: nominee);
                              }),
                          buildIcon(
                              imageString: 'assets/images/mediaIcon.png',
                              height: 100,
                              context: context,
                              function: () {
                                Navigator.pushNamed(context, MediaPage.id,
                                    arguments: nominee);
                              })
                        ],
                      ),
                    ),
                    buildIcon(
                        imageString: 'assets/images/SocialMedia.png',
                        height: 100,
                        context: context,
                        function: () {
                          Navigator.pushNamed(context, SocialMediaPage.id,
                              arguments: nominee);
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
