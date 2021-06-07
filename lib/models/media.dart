/// id : 1
/// url : "http://taboor.ly/"
/// desicription : "رابط لقاء على قناة ليبيا اليوم"

class Media {
  int _id;
  String _url;
  String _desicription;

  int get id => _id;
  String get url => _url;
  String get desicription => _desicription;

  Media({int id, String url, String desicription}) {
    _id = id;
    _url = url;
    _desicription = desicription;
  }

  Media.fromJson(dynamic json) {
    _id = json["id"];
    _url = json["url"];
    _desicription = json["desicription"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["url"] = _url;
    map["desicription"] = _desicription;
    return map;
  }

  @override
  String toString() {
    return 'Media{_id: $_id, _url: $_url, _desicription: $_desicription}';
  }
}
