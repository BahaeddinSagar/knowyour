/// id : 1
/// title : "فتح باب التسجيل للمترشحين من قبل المفوضية العليا للإنتخابات"
/// image : "/media/images/news/news.png"
/// updated_at : "2021-05-24"

class News {
  int _id;
  String _title;
  String _image;
  String _updatedAt;

  int get id => _id;
  String get title => _title;
  String get image => _image;
  String get updatedAt => _updatedAt;

  News({int id, String title, String image, String updatedAt}) {
    _id = id;
    _title = title;
    _image = image;
    _updatedAt = updatedAt;
  }

  News.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _image = json["image"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["image"] = _image;
    map["updated_at"] = _updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'News{_id: $_id, _title: $_title, _image: $_image, _updatedAt: $_updatedAt}';
  }
}
