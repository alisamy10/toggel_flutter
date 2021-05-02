import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggel_client/data/model/client_model.dart';
import 'package:toggel_client/data/model/project_model.dart';
import 'package:toggel_client/data/repository/repository.dart';
import 'package:toggel_client/data/source/local_source/secure_storage.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  Repository _repository;

  HomeCubit(this._repository) : super(HomeInitialState());


  void getTimes(String duration) {
    emit(HomeLoadingState());

    _repository.getRecentMonthTimeEntries(duration).then((value) {
      if (value == null || value.isEmpty)
        emit(HomeErrorState("error"));
      else
        emit(HomeSuccessState(value));
    }).catchError((onError) {
      print(onError.toString());
      emit(HomeErrorState(onError.toString()));
    });
  }



  void getUserProfile() {
    emit(ProfileLoadingState());



    SecureStorage.getUserObject().then((value) {
      if (value == null )
        emit(ProfileErrorState("error"));
      else
        emit(ProfileSuccessState(value));
    }).catchError((onError) {
      print(onError.toString());
      emit(ProfileErrorState("Error Loading Data !!"));
    });
  }

  Future<ProjectModel> getProjectName(int projectId) async {
    return await _repository.getProjectName(projectId);
  }

  Future<ClientModel> getClientName(int clientId) async {
    return await _repository.getClientName(clientId);
  }
}
