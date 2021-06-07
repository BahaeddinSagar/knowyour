/// id : 1
/// title : "فتح باب التسجيل للمترشحين من قبل المفوضية العليا للإنتخابات"
/// body : "<p>تفاصيل الخبر</p>"
/// image : "/media/images/news/news.png"
/// updated_at : "2021-05-24"

class NewsDetails {
  int _id;
  String _title;
  String _body;
  String _image;
  String _updatedAt;

  int get id => _id;
  String get title => _title;
  String get body => _body;
  String get image => _image;
  String get updatedAt => _updatedAt;

  NewsDetails(
      {int id, String title, String body, String image, String updatedAt}) {
    _id = id;
    _title = title;
    _body = body;
    _image = image;
    _updatedAt = updatedAt;
  }

  NewsDetails.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _body = json["body"];
    _image = json["image"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["body"] = _body;
    map["image"] = _image;
    map["updated_at"] = _updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'NewsDetails{_id: $_id, _title: $_title, _body: $_body, _image: $_image, _updatedAt: $_updatedAt}';
  }
}
