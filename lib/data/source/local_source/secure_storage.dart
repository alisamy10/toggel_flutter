import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toggel_client/data/model/user_model.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyUser = 'USERMODEL';

  static const _userToken="USERTOKEN";
  static const _theme="THEME";






  static Future clearData()async{
    await _storage.deleteAll();

  }




  static Future setThemeIsLight(bool theme) async {


    await _storage.write(key: _theme, value:json.encode(theme) );
  }
  static Future<String> getThemeIsLight() async =>
       _storage.read(key: _theme);



  static Future setUserToken(String userToken) async =>
      await _storage.write(key: _userToken, value: userToken);

  static Future<String> getUserToken() async =>
      await _storage.read(key: _userToken);









  static Future saveUserObject(UserModel user) async {

    final value = json.encode(user);

    await _storage.write(key: _keyUser, value: value);
  }




  static Future<UserModel> getUserObject() async {
    final value = await _storage.read(key: _keyUser);
    return value == null ? null : UserModel.fromJson(json.decode(value));

  }



}