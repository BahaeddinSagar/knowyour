/// id : 1
/// name : "محمد المختار"
/// facebook : "https://facebook.com"
/// twitter : "https://twitter.com"
/// instagram : "https://instagram.com"
/// snapchat : "https://snapchat.com"
/// youtube : "https://youtube.com"

class SocialMedia {
  int _id;
  String _name;
  String _facebook;
  String _twitter;
  String _instagram;
  String _snapchat;
  String _youtube;

  int get id => _id;
  String get name => _name;
  String get facebook => _facebook;
  String get twitter => _twitter;
  String get instagram => _instagram;
  String get snapchat => _snapchat;
  String get youtube => _youtube;

  SocialMedia(
      {int id,
      String name,
      String facebook,
      String twitter,
      String instagram,
      String snapchat,
      String youtube}) {
    _id = id;
    _name = name;
    _facebook = facebook;
    _twitter = twitter;
    _instagram = instagram;
    _snapchat = snapchat;
    _youtube = youtube;
  }

  SocialMedia.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _facebook = json["facebook"];
    _twitter = json["twitter"];
    _instagram = json["instagram"];
    _snapchat = json["snapchat"];
    _youtube = json["youtube"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["facebook"] = _facebook;
    map["twitter"] = _twitter;
    map["instagram"] = _instagram;
    map["snapchat"] = _snapchat;
    map["youtube"] = _youtube;
    return map;
  }

  @override
  String toString() {
    return 'SocialMedia{_id: $_id, _name: $_name, _facebook: $_facebook, _twitter: $_twitter, _instagram: $_instagram, _snapchat: $_snapchat, _youtube: $_youtube}';
  }
}
