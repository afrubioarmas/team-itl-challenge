import 'package:flutter/material.dart';
import 'package:team_intl_challenge/misc/service_locator.dart';
import 'package:team_intl_challenge/navigators/app_navigator/app_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    loadAppData();
  }

  loadAppData() async {
    await Future.delayed(Duration(seconds: 3));
    locator<AppNavigator>().toAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.height * 0.3,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Center(child: Image.asset("assets/logo.png")),
        ),
      ),
    );
  }
}
