import 'package:flutter/material.dart';
import 'package:knowyour/CustomWidgets/buildTile.dart';
import 'package:knowyour/models/media.dart';
import 'package:knowyour/models/nominee.dart';

import '../APICalls.dart';

class MediaPage extends StatelessWidget {
  static const id = "MediaPage";
  @override
  Widget build(BuildContext context) {
    final nominee = ModalRoute.of(context).settings.arguments as Nominee;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('وسائل الاعلام'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/newsImage.png'),
              ),
            ),
            flex: 1,
          ),
          Flexible(
            flex: 5,
            child: FutureBuilder(
              future: APICalls.getMedia(id: nominee.id.toString()),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Media> medias = snapshot.data;
                  return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.blue,
                          ),
                      itemBuilder: (context, index) {
                        Media m = medias[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              buildTile(imageURL: m.url, title: m.desicription),
                        );
                      },
                      itemCount: medias.length);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
