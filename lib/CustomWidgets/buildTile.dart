import 'package:flutter/material.dart';

Widget buildTile({String imageURL, String title}) {
  return Card(
    clipBehavior: Clip.antiAlias,
    elevation: 18.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: Container(
      decoration: BoxDecoration(color: Colors.orange),
      child: Column(
        children: [
          Image.network(
            imageURL,
            fit: BoxFit.fill,
          ),
          Text(title)
        ],
      ),
    ),
  );
}
