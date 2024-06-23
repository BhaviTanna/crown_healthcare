import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_project/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/splash_background.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              'assets/logo_with_name.png',
            ),
          ),
        ],
      ),
    );
  }
}
