import 'package:flutter/material.dart';

import 'package:knowyour/Pages/nomineeList.dart';
import 'package:knowyour/Pages/newsPage.dart';

import '../CustomWidgets/BuildIcon.dart';

class HomePage extends StatelessWidget {
  static const id = "homePage";
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
