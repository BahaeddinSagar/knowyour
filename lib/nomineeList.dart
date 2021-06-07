import 'package:flutter/material.dart';
import 'package:knowyour/APICalls.dart';

import 'models/nominee.dart';

class NomineeListPage extends StatelessWidget {
  static String id = "CandidateListPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المرشحين"),
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
            flex: 2,
          ),
          Flexible(
            flex: 1,
            child: DropdownButtonFormField(
              items: [],
            ),
          ),
          Flexible(
            flex: 10,
            child: FutureBuilder(
              future: APICalls.getNominees(id: "1"),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.blue,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Nominee nominee = snapshot.data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CandidateItem(
                            imageURL: APICalls.baseURL + nominee.profilePicture,
                            name: nominee.name,
                            location: nominee.region,
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CandidateItem extends StatelessWidget {
  final String imageURL, name, circle, location;
  CandidateItem({this.imageURL, this.name, this.circle, this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Image.network(
            imageURL,
            height: 100,
          ),
          flex: 1,
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 25),
                ),
                //  Text(circle),
                Text(location)
              ],
            ),
          ),
        )
      ],
    );
  }
}
