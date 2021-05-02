import 'package:toggel_client/data/model/time_entry_model.dart';
import 'package:toggel_client/data/model/user_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<TimeEntryModel> timesEntriesModel;

  HomeSuccessState(this.timesEntriesModel);
}

class HomeErrorState extends HomeStates {
  final String error;

  HomeErrorState(this.error);
}




class ProfileLoadingState extends HomeStates {}

class ProfileSuccessState extends HomeStates {
  final UserModel user;

  ProfileSuccessState(this.user);
}

class ProfileErrorState extends HomeStates {
  final String error;

  ProfileErrorState(this.error);
}