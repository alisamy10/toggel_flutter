import 'package:flutter/material.dart';
import 'package:toggel_client/data/source/local_source/secure_storage.dart';
import 'package:toggel_client/modules/home/home_screen.dart';
import 'package:toggel_client/modules/onboard/Onboard_screen.dart';
import 'package:toggel_client/shared/util/utility.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _checkUserLoggedIn() async {
    await SecureStorage.getUserToken().then((value) async {
      if (value != null) {
        navigateAndFinish(
          context,
          HomeScreen(),
        );
      } else {
        navigateAndFinish(
          context,
          OnBoardScreen(),
        );
      }
    });
  }

  @override
  void initState() {
    _checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
