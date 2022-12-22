import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Globals/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences? pref;

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () async {
      pref = await SharedPreferences.getInstance();

      bool? checkLogin = pref!.getBool("isLogin");

      if (checkLogin == true) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: splashBlackColor,
      body: Center(
        child: Text(
          "Best Seller Book",
          style: TextStyle(
              color: goldColor, fontWeight: FontWeight.bold, fontSize: 36),
        ),
      ),
    );
  }
}
