/// image : "/media/images/slides/slide1.png"
/// desicription : "test"
/// url : "http://google.com"
/// updated_at : "2021-05-24T23:00:45.657384+02:00"

class Ad {
  String _image;
  String _desicription;
  String _url;
  String _updatedAt;

  String get image => _image;
  String get desicription => _desicription;
  String get url => _url;
  String get updatedAt => _updatedAt;

  Ad({String image, String desicription, String url, String updatedAt}) {
    _image = image;
    _desicription = desicription;
    _url = url;
    _updatedAt = updatedAt;
  }

  Ad.fromJson(dynamic json) {
    _image = json["image"];
    _desicription = json["desicription"];
    _url = json["url"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["image"] = _image;
    map["desicription"] = _desicription;
    map["url"] = _url;
    map["updated_at"] = _updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'Ad{_image: $_image, _desicription: $_desicription, _url: $_url, _updatedAt: $_updatedAt}';
  }
}
