import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/login.dart';
import 'package:my_first_app/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (prefs!.containsKey("isLogined") &&
            prefs!.getBool("isLogined") == true) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
    );

    return const Scaffold();
  }
}
