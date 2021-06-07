/// id : 1
/// name : "طرابلس المركز"
/// electoral_districts : "دائرة طرابلس الكبرى"
/// seats : 15
/// parties_seats : 8
/// individuals_seats : 5
/// women_seats : 2
/// updated_at : "2021-05-24T22:47:46.654334+02:00"

class RegionDetails {
  int _id;
  String _name;
  String _electoralDistricts;
  int _seats;
  int _partiesSeats;
  int _individualsSeats;
  int _womenSeats;
  String _updatedAt;

  int get id => _id;
  String get name => _name;
  String get electoralDistricts => _electoralDistricts;
  int get seats => _seats;
  int get partiesSeats => _partiesSeats;
  int get individualsSeats => _individualsSeats;
  int get womenSeats => _womenSeats;
  String get updatedAt => _updatedAt;

  RegionDetails(
      {int id,
      String name,
      String electoralDistricts,
      int seats,
      int partiesSeats,
      int individualsSeats,
      int womenSeats,
      String updatedAt}) {
    _id = id;
    _name = name;
    _electoralDistricts = electoralDistricts;
    _seats = seats;
    _partiesSeats = partiesSeats;
    _individualsSeats = individualsSeats;
    _womenSeats = womenSeats;
    _updatedAt = updatedAt;
  }

  RegionDetails.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _electoralDistricts = json["electoral_districts"];
    _seats = json["seats"];
    _partiesSeats = json["parties_seats"];
    _individualsSeats = json["individuals_seats"];
    _womenSeats = json["women_seats"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["electoral_districts"] = _electoralDistricts;
    map["seats"] = _seats;
    map["parties_seats"] = _partiesSeats;
    map["individuals_seats"] = _individualsSeats;
    map["women_seats"] = _womenSeats;
    map["updated_at"] = _updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'RegionDetails{_id: $_id, _name: $_name, _electoralDistricts: $_electoralDistricts, _seats: $_seats, _partiesSeats: $_partiesSeats, _individualsSeats: $_individualsSeats, _womenSeats: $_womenSeats, _updatedAt: $_updatedAt}';
  }
}
