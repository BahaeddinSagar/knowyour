/// id : 1
/// name : "محمد المختار"
/// region : "طرابلس المركز"
/// profile_picture : "/media/images/nominees/Asset_71ldpi.png"
/// updated_at : "2021-05-24T22:57:24.488097+02:00"

class Nominee {
  int _id;
  String _name;
  String _region;
  String _profilePicture;
  String _updatedAt;

  int get id => _id;
  String get name => _name;
  String get region => _region;
  String get profilePicture => _profilePicture;
  String get updatedAt => _updatedAt;

  Nominee(
      {int id,
      String name,
      String region,
      String profilePicture,
      String updatedAt}) {
    _id = id;
    _name = name;
    _region = region;
    _profilePicture = profilePicture;
    _updatedAt = updatedAt;
  }

  Nominee.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _region = json["region"];
    _profilePicture = json["profile_picture"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["region"] = _region;
    map["profile_picture"] = _profilePicture;
    map["updated_at"] = _updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'Nominee{_id: $_id, _name: $_name, _region: $_region, _profilePicture: $_profilePicture, _updatedAt: $_updatedAt}';
  }
}
