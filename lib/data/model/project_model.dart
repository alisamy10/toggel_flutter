/// data : {"id":169479183,"wid":5345965,"cid":54358073,"name":"flutttter","billable":false,"is_private":false,"active":true,"template":false,"at":"2021-04-30T13:29:38+00:00","created_at":"2021-04-30T13:29:38+00:00","color":"13","auto_estimates":false,"hex_color":"#d92b2b"}

class ProjectModel {
  Data _data;

  Data get data => _data;

  ProjectModel({
      Data data}){
    _data = data;
}

  ProjectModel.fromJson(dynamic json) {
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

/// id : 169479183
/// wid : 5345965
/// cid : 54358073
/// name : "flutttter"
/// billable : false
/// is_private : false
/// active : true
/// template : false
/// at : "2021-04-30T13:29:38+00:00"
/// created_at : "2021-04-30T13:29:38+00:00"
/// color : "13"
/// auto_estimates : false
/// hex_color : "#d92b2b"

class Data {
  int _id;
  int _wid;
  int _cid;
  String _name;
  bool _billable;
  bool _isPrivate;
  bool _active;
  bool _template;
  String _at;
  String _createdAt;
  String _color;
  bool _autoEstimates;
  String _hexColor;

  int get id => _id;
  int get wid => _wid;
  int get cid => _cid;
  String get name => _name;
  bool get billable => _billable;
  bool get isPrivate => _isPrivate;
  bool get active => _active;
  bool get template => _template;
  String get at => _at;
  String get createdAt => _createdAt;
  String get color => _color;
  bool get autoEstimates => _autoEstimates;
  String get hexColor => _hexColor;

  Data({
      int id, 
      int wid, 
      int cid, 
      String name, 
      bool billable, 
      bool isPrivate, 
      bool active, 
      bool template, 
      String at, 
      String createdAt, 
      String color, 
      bool autoEstimates, 
      String hexColor}){
    _id = id;
    _wid = wid;
    _cid = cid;
    _name = name;
    _billable = billable;
    _isPrivate = isPrivate;
    _active = active;
    _template = template;
    _at = at;
    _createdAt = createdAt;
    _color = color;
    _autoEstimates = autoEstimates;
    _hexColor = hexColor;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _wid = json["wid"];
    _cid = json["cid"];
    _name = json["name"];
    _billable = json["billable"];
    _isPrivate = json["is_private"];
    _active = json["active"];
    _template = json["template"];
    _at = json["at"];
    _createdAt = json["created_at"];
    _color = json["color"];
    _autoEstimates = json["auto_estimates"];
    _hexColor = json["hex_color"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["wid"] = _wid;
    map["cid"] = _cid;
    map["name"] = _name;
    map["billable"] = _billable;
    map["is_private"] = _isPrivate;
    map["active"] = _active;
    map["template"] = _template;
    map["at"] = _at;
    map["created_at"] = _createdAt;
    map["color"] = _color;
    map["auto_estimates"] = _autoEstimates;
    map["hex_color"] = _hexColor;
    return map;
  }

}