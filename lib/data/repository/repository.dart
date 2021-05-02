

import 'package:toggel_client/data/model/client_model.dart';
import 'package:toggel_client/data/model/project_model.dart';
import 'package:toggel_client/data/model/time_entry_model.dart';
import 'package:toggel_client/data/model/user_model.dart';
import 'package:toggel_client/data/source/remote_source/api_client.dart';

class Repository {

ApiClient _apiClient;

Repository(this._apiClient);
  Future<UserModel> loginWithUserName(String username, String password ) async {



        return await _apiClient.loginWithUserName(username, password);

  }


Future<List<TimeEntryModel>> getRecentMonthTimeEntries(String duration) async {

   return await _apiClient.getRecentMonthTimeEntries( duration);
}

Future<ProjectModel> getProjectName(int projectId) async {

    return await _apiClient.getProjectName(projectId);
}


Future<ClientModel> getClientName(int clientId) async {

    return await _apiClient.getClientName(clientId);

}



}