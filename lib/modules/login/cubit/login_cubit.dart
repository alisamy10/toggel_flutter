import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggel_client/data/model/user_model.dart';
import 'package:toggel_client/data/repository/repository.dart';
import 'package:toggel_client/data/source/local_source/secure_storage.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  Repository _repository;

  LoginCubit(this._repository) : super(LoginInitialState());

  void userLogin({
    @required String email,
    @required String password,
  }) async {

    emit(LoginLoadingState());

    await _repository.loginWithUserName(email, password).then((value) async{
      if (value == null || value.data == null)
        emit(LoginErrorState("The user Name or pass is Wrong"));
      else {
        String basicAuth =
            'Basic ' + base64Encode(utf8.encode('$email:$password'));

        await SecureStorage.setUserToken(basicAuth);
        SecureStorage.saveUserObject(value).then((value) {
          emit(LoginSuccessState(value));
        });
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
