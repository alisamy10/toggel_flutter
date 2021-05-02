/// data : {"id":54358073,"wid":5345965,"name":"flutter","at":"2021-04-30T13:29:38+00:00"}

class ClientModel {
  Data _data;

  Data get data => _data;

  ClientModel({
      Data data}){
    _data = data;
}

  ClientModel.fromJson(dynamic json) {
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// id : 54358073
/// wid : 5345965
/// name : "flutter"
/// at : "2021-04-30T13:29:38+00:00"

class Data {
  int _id;
  int _wid;
  String _name;
  String _at;

  int get id => _id;
  int get wid => _wid;
  String get name => _name;
  String get at => _at;

  Data({
      int id, 
      int wid, 
      String name, 
      String at}){
    _id = id;
    _wid = wid;
    _name = name;
    _at = at;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _wid = json["wid"];
    _name = json["name"];
    _at = json["at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["wid"] = _wid;
    map["name"] = _name;
    map["at"] = _at;
    return map;
  }

}