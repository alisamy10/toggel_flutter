import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:toggel_client/data/model/client_model.dart';
import 'package:toggel_client/data/model/project_model.dart';
import 'package:toggel_client/data/model/time_entry_model.dart';
import 'package:toggel_client/data/model/user_model.dart';
import 'package:toggel_client/data/source/local_source/secure_storage.dart';
import 'package:toggel_client/shared/constant.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<UserModel> loginWithUserName(String username, String password) async {
    _dio.options.baseUrl = API_ENDPOINT;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    _dio.options.headers = {HttpHeaders.authorizationHeader: basicAuth};

    try {
      final response =
          await _dio.get("me", queryParameters: {"secret": '$username'});
      UserModel user = UserModel.fromJson(response.data);

      return user;
    } on DioError catch (e) {
      print(e.message);
    }
  }

  Future<List<TimeEntryModel>> getRecentMonthTimeEntries(
      String duration) async {
    List<TimeEntryModel> timesList = [];
    _dio.options.baseUrl = API_ENDPOINT;

    final token = await SecureStorage.getUserToken();

    _dio.options.headers = {HttpHeaders.authorizationHeader: token};

    try {
      Response<String> response = await _dio.get("time_entries$duration");

      var data = json.decode(response.data);
      data.map((post) => timesList.add(TimeEntryModel.fromJson(post))).toList();

      return timesList;
    } catch (e) {
      print(e.message);

      return timesList;
    }
  }

  Future<ProjectModel> getProjectName(int projectId) async {
    _dio.options.baseUrl = API_ENDPOINT;

    final token = await SecureStorage.getUserToken();

    _dio.options.headers = {HttpHeaders.authorizationHeader: token};

    try {
      final response = await _dio.get("projects/$projectId");
      ProjectModel projectModel = ProjectModel.fromJson(response.data);

      return projectModel;
    } on DioError catch (e) {
      print(e.message);
    }
  }

  Future<ClientModel> getClientName(int clientId) async {
    _dio.options.baseUrl = API_ENDPOINT;

    final token = await SecureStorage.getUserToken();

    _dio.options.headers = {HttpHeaders.authorizationHeader: token};

    try {
      final response = await _dio.get("clients/$clientId");

      ClientModel clientModel = ClientModel.fromJson(response.data);

      return clientModel;
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
