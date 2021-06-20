import 'dart:convert';
import 'package:http/http.dart' as HttpClass;
import 'package:flutter/material.dart';
import 'package:knowyour/APICalls.dart';
import 'package:knowyour/Pages/nomineeDetails.dart';
import 'package:knowyour/models/district.dart';
import 'package:knowyour/models/region.dart';

import '../models/nominee.dart';

class NomineeListPage extends StatefulWidget {
  static const id = 'NomineeListPage';

  @override
  _NomineeListPageState createState() => _NomineeListPageState();
}

class _NomineeListPageState extends State<NomineeListPage> {
  int selectedDistrict;
  int selectedRegion;
  List<District> districts;

  @override
  void initState() {
    getDistricts();
    super.initState();
  }

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
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value;
                  selectedRegion = null;
                  print(selectedDistrict);
                });
              },
              items: districts.map(
                (item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                },
              ).toList(),
            ),
          ),
          Flexible(
            flex: 1,
            child: selectedDistrict == null
                ? DropdownButton(items: [])
                : FutureBuilder(
                    future:
                        APICalls.getRegions(id: selectedDistrict.toString()),
                    builder: (context, snapshot) {
                      if (snapshot == null) {
                        return DropdownButton(items: [
                          DropdownMenuItem(
                            child: Text('Loading'),
                          )
                        ]);
                      } else {
                        final List<Region> regions =
                            snapshot.data as List<Region>;
                        print(regions);
                        return DropdownButtonFormField(
                          onChanged: (value) {
                            setState(() {
                              selectedRegion = value;
                              print(selectedRegion);
                            });
                          },
                          items: regions.map(
                            (item) {
                              return DropdownMenuItem(
                                  child: Text(item.name), value: item.id);
                            },
                          ).toList(),
                        );
                      }
                    },
                  ),
          ),
          Flexible(
            flex: 10,
            child: selectedRegion == null
                ? ListView()
                : FutureBuilder(
                    future: APICalls.getNominees(id: selectedRegion.toString()),
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
                                  nominee: nominee,
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
  final Nominee nominee;
  CandidateItem({this.nominee});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NomineeDetails.id, arguments: nominee);
      },
      child: Row(
        children: [
          Flexible(
            child: Image.network(
              nominee.profilePicture,
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
                    nominee.name,
                    style: TextStyle(fontSize: 25),
                  ),
                  //  Text(circle),
                  Text(nominee.region)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
