/// id : 1
/// name : "دائرة طرابلس الكبرى"
/// updated_at : "2021-05-24T22:45:58.542843+02:00"

class District {
  int _id;
  String _name;
  String _updatedAt;

  int get id => _id;
  String get name => _name;
  String get updatedAt => _updatedAt;

  District({int id, String name, String updatedAt}) {
    _id = id;
    _name = name;
    _updatedAt = updatedAt;
  }

  District.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["updated_at"] = _updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'District{_id: $_id, _name: $_name, _updatedAt: $_updatedAt}';
  }
}
