import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggel_client/data/source/local_source/secure_storage.dart';
import 'package:toggel_client/modules/home/ui/all_task_screen.dart';
import 'package:toggel_client/modules/home/ui/profile_screen.dart';
import 'package:toggel_client/modules/home/ui/some_task_screen.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  int currentIndex = 0;

  List<Widget> screens = [
    SomeTaskScreen(),
    AllTaskScreen(),

    ProfileScreen(),
  ];

  List<String> titles = [
    'Some Tasks',
    'All Tasks',
    'Profile ',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.article_sharp,
      ),
      label: 'some task',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.article_sharp,
      ),
      label: 'all tasks',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: 'profile',
    ),
  ];

  bool isLight = true;

  void changeAppMode() async {
    isLight = !isLight;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("isLight", isLight);

    await SecureStorage.setThemeIsLight(isLight);

    emit(AppChangeModeState());
  }
}
