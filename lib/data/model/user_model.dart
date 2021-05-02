

class UserModel {
  int _since;
  Data _data;

  int get since => _since;
  Data get data => _data;


  @override
  String toString() {
    return 'UserModel{_since: $_since, _data: $_data}';
  }

  UserModel({
      int since, 
      Data data}){
    _since = since;
    _data = data;
}

  UserModel.fromJson(dynamic json) {
    _since = json["since"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["since"] = _since;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}


class Data {
  int _id;
  String _apiToken;
  int _defaultWid;
  String _email;
  String _fullname;
  String _jqueryTimeofdayFormat;
  String _jqueryDateFormat;
  String _timeofdayFormat;
  String _dateFormat;
  bool _storeStartAndStopTime;
  int _beginningOfWeek;
  String _language;
  String _imageUrl;
  bool _sidebarPiechart;
  String _at;
  String _createdAt;
  int _retention;
  bool _recordTimeline;
  bool _renderTimeline;
  bool _timelineEnabled;
  bool _timelineExperiment;
  bool _shouldUpgrade;
  String _timezone;
  bool _openidEnabled;
  bool _sendProductEmails;
  bool _sendWeeklyReport;
  bool _sendTimerNotifications;
  Invitation _invitation;
  List<Workspaces> _workspaces;
  String _durationFormat;


  @override
  String toString() {
    return 'Data{_id: $_id, _apiToken: $_apiToken, _defaultWid: $_defaultWid, _email: $_email, _fullname: $_fullname, _jqueryTimeofdayFormat: $_jqueryTimeofdayFormat, _jqueryDateFormat: $_jqueryDateFormat, _timeofdayFormat: $_timeofdayFormat, _dateFormat: $_dateFormat, _storeStartAndStopTime: $_storeStartAndStopTime, _beginningOfWeek: $_beginningOfWeek, _language: $_language, _imageUrl: $_imageUrl, _sidebarPiechart: $_sidebarPiechart, _at: $_at, _createdAt: $_createdAt, _retention: $_retention, _recordTimeline: $_recordTimeline, _renderTimeline: $_renderTimeline, _timelineEnabled: $_timelineEnabled, _timelineExperiment: $_timelineExperiment, _shouldUpgrade: $_shouldUpgrade, _timezone: $_timezone, _openidEnabled: $_openidEnabled, _sendProductEmails: $_sendProductEmails, _sendWeeklyReport: $_sendWeeklyReport, _sendTimerNotifications: $_sendTimerNotifications, _invitation: $_invitation, _workspaces: $_workspaces, _durationFormat: $_durationFormat}';
  }

  int get id => _id;
  String get apiToken => _apiToken;
  int get defaultWid => _defaultWid;
  String get email => _email;
  String get fullname => _fullname;
  String get jqueryTimeofdayFormat => _jqueryTimeofdayFormat;
  String get jqueryDateFormat => _jqueryDateFormat;
  String get timeofdayFormat => _timeofdayFormat;
  String get dateFormat => _dateFormat;
  bool get storeStartAndStopTime => _storeStartAndStopTime;
  int get beginningOfWeek => _beginningOfWeek;
  String get language => _language;
  String get imageUrl => _imageUrl;
  bool get sidebarPiechart => _sidebarPiechart;
  String get at => _at;
  String get createdAt => _createdAt;
  int get retention => _retention;
  bool get recordTimeline => _recordTimeline;
  bool get renderTimeline => _renderTimeline;
  bool get timelineEnabled => _timelineEnabled;
  bool get timelineExperiment => _timelineExperiment;
  bool get shouldUpgrade => _shouldUpgrade;
  String get timezone => _timezone;
  bool get openidEnabled => _openidEnabled;
  bool get sendProductEmails => _sendProductEmails;
  bool get sendWeeklyReport => _sendWeeklyReport;
  bool get sendTimerNotifications => _sendTimerNotifications;
  Invitation get invitation => _invitation;
  List<Workspaces> get workspaces => _workspaces;
  String get durationFormat => _durationFormat;

  Data({
    int id,
    String apiToken,
    int defaultWid,
    String email,
    String fullname,
    String jqueryTimeofdayFormat,
    String jqueryDateFormat,
    String timeofdayFormat,
    String dateFormat,
    bool storeStartAndStopTime,
    int beginningOfWeek,
    String language,
    String imageUrl,
    bool sidebarPiechart,
    String at,
    String createdAt,
    int retention,
    bool recordTimeline,
    bool renderTimeline,
    bool timelineEnabled,
    bool timelineExperiment,
    bool shouldUpgrade,
    String timezone,
    bool openidEnabled,
    bool sendProductEmails,
    bool sendWeeklyReport,
    bool sendTimerNotifications,
    Invitation invitation,
    List<Workspaces> workspaces,
    String durationFormat}){
    _id = id;
    _apiToken = apiToken;
    _defaultWid = defaultWid;
    _email = email;
    _fullname = fullname;
    _jqueryTimeofdayFormat = jqueryTimeofdayFormat;
    _jqueryDateFormat = jqueryDateFormat;
    _timeofdayFormat = timeofdayFormat;
    _dateFormat = dateFormat;
    _storeStartAndStopTime = storeStartAndStopTime;
    _beginningOfWeek = beginningOfWeek;
    _language = language;
    _imageUrl = imageUrl;
    _sidebarPiechart = sidebarPiechart;
    _at = at;
    _createdAt = createdAt;
    _retention = retention;
    _recordTimeline = recordTimeline;
    _renderTimeline = renderTimeline;
    _timelineEnabled = timelineEnabled;
    _timelineExperiment = timelineExperiment;
    _shouldUpgrade = shouldUpgrade;
    _timezone = timezone;
    _openidEnabled = openidEnabled;
    _sendProductEmails = sendProductEmails;
    _sendWeeklyReport = sendWeeklyReport;
    _sendTimerNotifications = sendTimerNotifications;
    _invitation = invitation;
    _workspaces = workspaces;
    _durationFormat = durationFormat;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _apiToken = json["api_token"];
    _defaultWid = json["default_wid"];
    _email = json["email"];
    _fullname = json["fullname"];
    _jqueryTimeofdayFormat = json["jquery_timeofday_format"];
    _jqueryDateFormat = json["jquery_date_format"];
    _timeofdayFormat = json["timeofday_format"];
    _dateFormat = json["date_format"];
    _storeStartAndStopTime = json["store_start_and_stop_time"];
    _beginningOfWeek = json["beginning_of_week"];
    _language = json["language"];
    _imageUrl = json["image_url"];
    _sidebarPiechart = json["sidebar_piechart"];
    _at = json["at"];
    _createdAt = json["created_at"];
    _retention = json["retention"];
    _recordTimeline = json["record_timeline"];
    _renderTimeline = json["render_timeline"];
    _timelineEnabled = json["timeline_enabled"];
    _timelineExperiment = json["timeline_experiment"];
    _shouldUpgrade = json["should_upgrade"];
    _timezone = json["timezone"];
    _openidEnabled = json["openid_enabled"];
    _sendProductEmails = json["send_product_emails"];
    _sendWeeklyReport = json["send_weekly_report"];
    _sendTimerNotifications = json["send_timer_notifications"];
    _invitation = json["invitation"] != null ? Invitation.fromJson(json["invitation"]) : null;
    if (json["workspaces"] != null) {
      _workspaces = [];
      json["workspaces"].forEach((v) {
        _workspaces.add(Workspaces.fromJson(v));
      });
    }
    _durationFormat = json["duration_format"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["api_token"] = _apiToken;
    map["default_wid"] = _defaultWid;
    map["email"] = _email;
    map["fullname"] = _fullname;
    map["jquery_timeofday_format"] = _jqueryTimeofdayFormat;
    map["jquery_date_format"] = _jqueryDateFormat;
    map["timeofday_format"] = _timeofdayFormat;
    map["date_format"] = _dateFormat;
    map["store_start_and_stop_time"] = _storeStartAndStopTime;
    map["beginning_of_week"] = _beginningOfWeek;
    map["language"] = _language;
    map["image_url"] = _imageUrl;
    map["sidebar_piechart"] = _sidebarPiechart;
    map["at"] = _at;
    map["created_at"] = _createdAt;
    map["retention"] = _retention;
    map["record_timeline"] = _recordTimeline;
    map["render_timeline"] = _renderTimeline;
    map["timeline_enabled"] = _timelineEnabled;
    map["timeline_experiment"] = _timelineExperiment;
    map["should_upgrade"] = _shouldUpgrade;
    map["timezone"] = _timezone;
    map["openid_enabled"] = _openidEnabled;
    map["send_product_emails"] = _sendProductEmails;
    map["send_weekly_report"] = _sendWeeklyReport;
    map["send_timer_notifications"] = _sendTimerNotifications;
    if (_invitation != null) {
      map["invitation"] = _invitation.toJson();
    }
    if (_workspaces != null) {
      map["workspaces"] = _workspaces.map((v) => v.toJson()).toList();
    }
    map["duration_format"] = _durationFormat;
    return map;
  }

}

class Invitation {


  Invitation.fromJson(dynamic json) {

  }


  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

    return map;
  }


}



class Workspaces {
  int _id;
  String _name;
  int _profile;
  bool _premium;
  bool _admin;
  int _defaultHourlyRate;
  String _defaultCurrency;
  bool _onlyAdminsMayCreateProjects;
  bool _onlyAdminsSeeBillableRates;
  bool _onlyAdminsSeeTeamDashboard;
  bool _projectsBillableByDefault;
  int _rounding;
  int _roundingMinutes;
  String _apiToken;
  String _at;
  bool _icalEnabled;

  int get id => _id;
  String get name => _name;
  int get profile => _profile;
  bool get premium => _premium;
  bool get admin => _admin;
  int get defaultHourlyRate => _defaultHourlyRate;
  String get defaultCurrency => _defaultCurrency;
  bool get onlyAdminsMayCreateProjects => _onlyAdminsMayCreateProjects;
  bool get onlyAdminsSeeBillableRates => _onlyAdminsSeeBillableRates;
  bool get onlyAdminsSeeTeamDashboard => _onlyAdminsSeeTeamDashboard;
  bool get projectsBillableByDefault => _projectsBillableByDefault;
  int get rounding => _rounding;
  int get roundingMinutes => _roundingMinutes;
  String get apiToken => _apiToken;
  String get at => _at;
  bool get icalEnabled => _icalEnabled;

  Workspaces({
    int id,
    String name,
    int profile,
    bool premium,
    bool admin,
    int defaultHourlyRate,
    String defaultCurrency,
    bool onlyAdminsMayCreateProjects,
    bool onlyAdminsSeeBillableRates,
    bool onlyAdminsSeeTeamDashboard,
    bool projectsBillableByDefault,
    int rounding,
    int roundingMinutes,
    String apiToken,
    String at,
    bool icalEnabled}){
    _id = id;
    _name = name;
    _profile = profile;
    _premium = premium;
    _admin = admin;
    _defaultHourlyRate = defaultHourlyRate;
    _defaultCurrency = defaultCurrency;
    _onlyAdminsMayCreateProjects = onlyAdminsMayCreateProjects;
    _onlyAdminsSeeBillableRates = onlyAdminsSeeBillableRates;
    _onlyAdminsSeeTeamDashboard = onlyAdminsSeeTeamDashboard;
    _projectsBillableByDefault = projectsBillableByDefault;
    _rounding = rounding;
    _roundingMinutes = roundingMinutes;
    _apiToken = apiToken;
    _at = at;
    _icalEnabled = icalEnabled;
  }

  Workspaces.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _profile = json["profile"];
    _premium = json["premium"];
    _admin = json["admin"];
    _defaultHourlyRate = json["default_hourly_rate"];
    _defaultCurrency = json["default_currency"];
    _onlyAdminsMayCreateProjects = json["only_admins_may_create_projects"];
    _onlyAdminsSeeBillableRates = json["only_admins_see_billable_rates"];
    _onlyAdminsSeeTeamDashboard = json["only_admins_see_team_dashboard"];
    _projectsBillableByDefault = json["projects_billable_by_default"];
    _rounding = json["rounding"];
    _roundingMinutes = json["rounding_minutes"];
    _apiToken = json["api_token"];
    _at = json["at"];
    _icalEnabled = json["ical_enabled"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["profile"] = _profile;
    map["premium"] = _premium;
    map["admin"] = _admin;
    map["default_hourly_rate"] = _defaultHourlyRate;
    map["default_currency"] = _defaultCurrency;
    map["only_admins_may_create_projects"] = _onlyAdminsMayCreateProjects;
    map["only_admins_see_billable_rates"] = _onlyAdminsSeeBillableRates;
    map["only_admins_see_team_dashboard"] = _onlyAdminsSeeTeamDashboard;
    map["projects_billable_by_default"] = _projectsBillableByDefault;
    map["rounding"] = _rounding;
    map["rounding_minutes"] = _roundingMinutes;
    map["api_token"] = _apiToken;
    map["at"] = _at;
    map["ical_enabled"] = _icalEnabled;
    return map;
  }

}