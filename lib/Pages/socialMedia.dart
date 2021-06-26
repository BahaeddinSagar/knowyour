import 'package:flutter/material.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/models/nominee.dart';
import 'package:knowyour/models/social_media.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaPage extends StatefulWidget {
  static const id = "Social Media Page";

  @override
  _SocialMediaPageState createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nominee = ModalRoute.of(context).settings.arguments as Nominee;
    APICalls.getSocialMedia(id: nominee.id.toString());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: APICalls.getSocialMedia(id: nominee.id.toString()),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              var socialMedia = snapshot.data as SocialMedia;
              print(socialMedia);
              return GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                children: [
                  buildInkWell(socialMedia.facebook, 'facebook.png'),
                  buildInkWell(socialMedia.twitter, 'twitter.png'),
                  buildInkWell(socialMedia.youtube, 'youtube.png'),
                  buildInkWell(socialMedia.instagram, 'instagram.png'),
                  buildInkWell(socialMedia.snapchat, 'snapchat.png'),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildInkWell(String url, String image) {
    return url == null
        ? Container()
        : InkWell(
            onTap: () {
              openURL(url);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/socialMediaIcons/' + image,
                fit: BoxFit.contain,
              ),
            ),
          );
  }

  openURL(String url) {
    if (url.isEmpty) {
    } else {
      if (canLaunch(url) != null)
        launch(url);
      else
        throw "Could not launch $url";
    }
  }
}
