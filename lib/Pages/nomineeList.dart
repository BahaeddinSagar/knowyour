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
  List<Region> regions;

  final String _apiURL = APICalls.baseURL + '/API/';

  getDistricts() async {
    var url = Uri.parse(_apiURL + 'Electoral_districts');
    var response = await HttpClass.get(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var decoded = jsonDecode(jsonResponse);
      var list = decoded['districts'] as List;
      List<District> dists = list.map((e) => District.fromJson(e)).toList();
      print(dists.toString());
      setState(() {
        districts = dists;
      });
    } else {
      print("ERROR " + response.headers.toString());
      print(response.request);
      print(response.request.headers);
      return null;
    }
  }

  getRegions({@required String id}) async {
    var url = Uri.parse(_apiURL + 'Regions');
    var resonse = await HttpClass.post(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
      body: {'electrocal_district_id': id},
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);
      var list = decoded['regions'] as List;
      List<Region> regs = list.map((e) => Region.fromJson(e)).toList();
      print(regs.toString());
      setState(() {
        regions = regs;
        selectedRegion = regions[0].id;
      });
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

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
      body: districts == null
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                        getRegions(id: selectedDistrict.toString());
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
                  child: regions == null
                      ? DropdownButtonFormField(items: [])
                      : DropdownButtonFormField(
                          onChanged: (value) {
                            setState(() {
                              selectedRegion = value;
                              print(selectedRegion);
                            });
                          },
                          value: regions[0].id,
                          items: regions.map(
                            (item) {
                              return DropdownMenuItem(
                                  child: Text(item.name), value: item.id);
                            },
                          ).toList(),
                        ),
                ),
                Flexible(
                  flex: 10,
                  child: selectedRegion == null
                      ? ListView()
                      : FutureBuilder(
                          future: APICalls.getNominees(
                              id: selectedRegion.toString()),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.data.length == 0) {
                              return Center(
                                child: Image.asset(
                                  'assets/images/issueIcon.png',
                                  height: 200,
                                ),
                              );
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
