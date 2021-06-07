import 'package:flutter/material.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/nomineeList.dart';
import 'package:knowyour/newsPage.dart';

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
                  'assets/images/adImage.png',
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
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NomineeListPage.id);
                },
                child: buildIcon(
                    imageString: 'assets/images/candidateIcon.png',
                    goTo: 'candidates'),
              ),
              flex: 4,
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: buildIcon(
                  imageString: 'assets/images/resultsIcon.png',
                  goTo: 'results'),
              flex: 4,
            )
          ],
        ),
        Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NewsPage.id);
                },
                child: buildIcon(
                    imageString: 'assets/images/newsIcon.png', goTo: 'news'),
              ),
              flex: 4,
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: buildIcon(
                  imageString: 'assets/images/mapIcon.png', goTo: 'map'),
              flex: 4,
            ),
          ],
        )
      ],
    );
  }

  InkWell buildIcon({String imageString, String goTo}) {
    return InkWell(
      child: Image.asset(imageString),
      onTap: () {
        APICalls.getNominees(id: '1');
        APICalls.getCV(id: '1');
        APICalls.getProgram(id: '1');
        APICalls.getSocialMedia(id: '1');
        APICalls.getMedia(id: '1');
        print('you clicked ' + goTo);
      },
    );
  }
}
