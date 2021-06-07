/// id : 1
/// program : "<p>سيتم العمل على تمكين&nbsp;</p>"

class Program {
  int _id;
  String _program;

  int get id => _id;
  String get program => _program;

  Program({int id, String program}) {
    _id = id;
    _program = program;
  }

  Program.fromJson(dynamic json) {
    _id = json["id"];
    _program = json["program"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["program"] = _program;
    return map;
  }

  @override
  String toString() {
    return 'Program{_id: $_id, _program: $_program}';
  }
}
