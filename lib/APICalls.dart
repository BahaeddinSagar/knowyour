import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as HttpClass;
import 'package:knowyour/models/district.dart';
import 'package:knowyour/models/news_details.dart';
import 'package:knowyour/models/nominee.dart';
import 'package:knowyour/models/program.dart';
import 'package:knowyour/models/region.dart';
import 'package:knowyour/models/region_details.dart';
import 'package:knowyour/models/social_media.dart';

import 'models/ad.dart';
import 'models/c_v.dart';
import 'models/media.dart';
import 'models/news.dart';

class APICalls {
  static final String baseURL = 'https://lacit.ly';
  static final String _apiURL = baseURL + '/API/';

  static Future<List<Ad>> getAds() async {
    var url = Uri.parse(_apiURL + 'Home');
    var response = await HttpClass.get(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var decoded = jsonDecode(jsonResponse);
      var list = decoded['slides'] as List;
      List<Ad> ads = list.map((e) => Ad.fromJson(e)).toList();
      //(ads.toString());
      return ads;
    } else {
      print("ERROR " + response.headers.toString());
      print(response.request);
      print(response.request.headers);
      return null;
    }
  }

  static Future<List<District>> getDistricts() async {
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
      List<District> districts = list.map((e) => District.fromJson(e)).toList();
      //print(districts.toString());
      return districts;
    } else {
      print("ERROR " + response.headers.toString());
      print(response.request);
      print(response.request.headers);
      return null;
    }
  }

  static Future<List<Region>> getRegions({@required String id}) async {
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
      List<Region> regions = list.map((e) => Region.fromJson(e)).toList();
      //print(regions.toString());
      return regions;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

  static Future<RegionDetails> getRegionDetails({@required String id}) async {
    var url = Uri.parse(_apiURL + 'Region_details');
    var resonse = await HttpClass.post(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
      body: {'region_id': id},
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);
      var regionjson = decoded['region'];
      RegionDetails regionDetails = RegionDetails.fromJson(regionjson);
      //print(regionDetails.toString());
      return regionDetails;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

  static Future<List<News>> getnews() async {
    var url = Uri.parse(_apiURL + 'News');
    var resonse = await HttpClass.get(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);
      var list = decoded['news'] as List;
      List<News> news = list.map((e) => News.fromJson(e)).toList();
      //print(news.toString());
      return news;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

  static Future<NewsDetails> getNewsDetails({@required String id}) async {
    var url = Uri.parse(_apiURL + 'News_details');
    var resonse = await HttpClass.post(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
      body: {'news_id': id},
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);
      var newsJSON = decoded['news'];
      NewsDetails newsDetails = NewsDetails.fromJson(newsJSON);
      //print(newsDetails.toString());
      return newsDetails;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

  static Future<List<Nominee>> getNominees({@required String id}) async {
    var url = Uri.parse(_apiURL + 'Nominees');
    var resonse = await HttpClass.post(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
      body: {'region_id': id},
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);
      //print(decoded);
      var list = decoded['nominees'] as List;
      var region = decoded['region'] as String;
      var district = decoded['electoral_districts'] as String;
      List<Nominee> nominees =
          list.map((e) => Nominee.fromJson(e, region, district)).toList();
      print(nominees.toString());
      return nominees;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

  static Future<CV> getCV({@required String id}) async {
    var url = Uri.parse(_apiURL + 'CV');
    var resonse = await HttpClass.post(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
      body: {'nominee_id': id},
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);

      CV cv = CV.fromJson(decoded);
      //print(cv.toString());
      return cv;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

  static Future<Program> getProgram({@required String id}) async {
    var url = Uri.parse(_apiURL + 'Program');
    var resonse = await HttpClass.post(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
      body: {'nominee_id': id},
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);

      Program program = Program.fromJson(decoded);
      //print(program.toString());
      return program;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

  static Future<SocialMedia> getSocialMedia({@required String id}) async {
    var url = Uri.parse(_apiURL + 'Social_media');
    var resonse = await HttpClass.post(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
      body: {'nominee_id': id},
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);

      SocialMedia socialMedia = SocialMedia.fromJson(decoded);
      //print(socialMedia.toString());
      return socialMedia;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }

  static Future<List<Media>> getMedia({@required String id}) async {
    var url = Uri.parse(_apiURL + 'Media');
    var resonse = await HttpClass.post(
      url,
      headers: {
        'TOKEN': 'brHabhL0.z8K5naWw59eBgIIsidCIWsxDGkgVxgji',
      },
      body: {'nominee_id': id},
    );
    if (resonse.statusCode == 200) {
      var jsonResponse = resonse.body;
      var decoded = jsonDecode(jsonResponse);
      var list = decoded['media'] as List;
      List<Media> mideas = list.map((e) => Media.fromJson(e)).toList();
      //print(mideas.toString());
      return mideas;
    } else {
      print("ERROR " + resonse.headers.toString());
      print(resonse.request);
      print(resonse.request.headers);
      return null;
    }
  }
}
