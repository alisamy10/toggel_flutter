

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:toggel_client/data/repository/repository.dart';
import 'package:toggel_client/data/source/remote_source/api_client.dart';
import 'package:toggel_client/modules/home/cubit/home_cubit.dart';
import 'package:toggel_client/modules/login/cubit/login_cubit.dart';
import 'package:toggel_client/shared/cubit/app_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {


  getIt.registerFactory<LoginCubit>(
        () => LoginCubit(
      getIt<Repository>(),
    ),
  );


  getIt.registerFactory<AppCubit>(

       () => AppCubit(

    ),
  );

  getIt.registerFactory<HomeCubit>(
        () => HomeCubit(
          getIt<Repository>(),
    ),
  );
  getIt.registerFactory<Repository>(
        () => Repository(getIt()),
  );
  getIt.registerFactory<ApiClient>(() => ApiClient(getIt()));
  getIt.registerFactory(() => Dio());







}