import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggel_client/data/source/local_source/secure_storage.dart';
import 'package:toggel_client/di/injector.dart' as di;
import 'package:toggel_client/shared/cubit/app_cubit.dart';
import 'package:toggel_client/shared/cubit/app_state.dart';
import 'package:toggel_client/shared/resource/theme.dart';
import 'di/injector.dart';
import 'modules/splash/splash.dart';
import 'shared/bloc_observer.dart';

SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  Bloc.observer = MyBlocObserver();
  if (sharedPreferences == null)
    sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<AppCubit>(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (contetx, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: sharedPreferences.getBool("isLight") ?? true
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: SplashScreen(),
            );
          },
        ));
  }
}
