import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:knowyour/CustomWidgets/BuildIcon.dart';
import 'package:knowyour/Pages/CV.dart';
import 'package:knowyour/Pages/electionProgram.dart';
import 'package:knowyour/Pages/mediaPage.dart';

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
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Column(
                    children: [
                      Image.network(
                        nominee.profilePicture,
                        fit: BoxFit.fill,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 1,
                            child: buildIcon(
                                imageString: 'assets/images/CVIcon.png',
                                context: context,
                                function: () {
                                  print(nominee);
                                  Navigator.pushNamed(context, CVPage.id,
                                      arguments: nominee);
                                }),
                          ),
                          Flexible(
                            flex: 1,
                            child: buildIcon(
                                imageString: 'assets/images/blankIcon.png',
                                context: context,
                                function: () {
                                  Navigator.pushNamed(
                                      context, ElectionProgramPage.id,
                                      arguments: nominee);
                                }),
                          ),
                          Flexible(
                            flex: 1,
                            child: buildIcon(
                                imageString: 'assets/images/mediaIcon.png',
                                context: context,
                                function: () {
                                  Navigator.pushNamed(context, MediaPage.id,
                                      arguments: nominee);
                                }),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildIcon(
                          imageString: 'assets/images/SocialMedia.png',
                          context: context,
                          function: () {
                            Navigator.pushNamed(context, 'media',
                                arguments: nominee);
                          }),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
