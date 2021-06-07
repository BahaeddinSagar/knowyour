/// id : 1
/// name : "محمد المختار"
/// region : "طرابلس المركز"
/// electoral_districts : "دائرة طرابلس الكبرى"
/// cv : "<p><strong>المواليد:</strong> 35 سنة</p>\r\n\r\n<p><strong>المؤهل العلمي:</strong> بكالوريس</p>"

class CV {
  int _id;
  String _name;
  String _region;
  String _electoralDistricts;
  String _cv;

  int get id => _id;
  String get name => _name;
  String get region => _region;
  String get electoralDistricts => _electoralDistricts;
  String get cv => _cv;

  CV(
      {int id,
      String name,
      String region,
      String electoralDistricts,
      String cv}) {
    _id = id;
    _name = name;
    _region = region;
    _electoralDistricts = electoralDistricts;
    _cv = cv;
  }

  CV.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _region = json["region"];
    _electoralDistricts = json["electoral_districts"];
    _cv = json["cv"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["region"] = _region;
    map["electoral_districts"] = _electoralDistricts;
    map["cv"] = _cv;
    return map;
  }

  @override
  String toString() {
    return 'CV{_id: $_id, _name: $_name, _region: $_region, _electoralDistricts: $_electoralDistricts, _cv: $_cv}';
  }
}
