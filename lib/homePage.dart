import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String id = "homePage";
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
                child: groupButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class groupButtons extends StatelessWidget {
  const groupButtons({
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
              child: buildIcon(
                  imageString: 'assets/images/candidateIcon.png',
                  goTo: 'candidates'),
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
              child: buildIcon(
                  imageString: 'assets/images/newsIcon.png', goTo: 'news'),
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
        print('you clicked ' + goTo);
      },
    );
  }
}
