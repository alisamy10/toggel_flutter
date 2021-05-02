/// id : 1992029296
/// guid : "5052263abaa69e5e25976b95abd3522f"
/// wid : 5345965
/// pid : 169479183
/// billable : false
/// start : "2021-04-30T13:28:34+00:00"
/// duration : -1619789314
/// description : "Study "
/// tags : ["bloc","bloc","statemangment #"]
/// duronly : false
/// at : "2021-04-30T13:32:39+00:00"
/// uid : 6839981

class TimeEntryModel {
  int _id;
  String _guid;
  int _wid;
  int _pid;
  bool _billable;
  String _start;
  String _stop;
  int _duration;
  String _description;
  List<String> _tags;
  bool _duronly;
  String _at;
  int _uid;

  int get id => _id;
  String get guid => _guid;
  int get wid => _wid;
  int get pid => _pid;
  bool get billable => _billable;
  String get start => _start;
  String get stop => _stop;

  int get duration => _duration;
  String get description => _description;
  List<String> get tags => _tags;
  bool get duronly => _duronly;
  String get at => _at;
  int get uid => _uid;

  TimeEntryModel({
      int id, 
      String guid, 
      int wid, 
      int pid,
      bool billable,
      String start,
    String stop,
      int duration, 
      String description, 
      List<String> tags,
      bool duronly,
      String at,
      int uid}){
    _id = id;
    _guid = guid;
    _wid = wid;
    _pid = pid;
    _billable = billable;
    _start = start;
    _stop=stop;
    _duration = duration;
    _description = description;
    _tags = tags;
    _duronly = duronly;
    _at = at;
    _uid = uid;
}

  TimeEntryModel.fromJson(dynamic json) {
    _id = json["id"];
    _guid = json["guid"];
    _wid = json["wid"];
    _pid = json["pid"];
    _billable = json["billable"];
    _start = json["start"];
    _stop=json["stop"];
    _duration = json["duration"];
    _description = json["description"];
    _tags = json["tags"] != null ? json["tags"].cast<String>() : [];
    _duronly = json["duronly"];
    _at = json["at"];
    _uid = json["uid"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["guid"] = _guid;
    map["wid"] = _wid;
    map["pid"] = _pid;
    map["billable"] = _billable;
    map["start"] = _start;
    map["stop"]=_stop;
    map["duration"] = _duration;
    map["description"] = _description;
    map["tags"] = _tags;
    map["duronly"] = _duronly;
    map["at"] = _at;
    map["uid"] = _uid;
    return map;
  }

}