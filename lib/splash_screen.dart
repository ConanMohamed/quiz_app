import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: EasySplashScreen(
          logo: Image.asset('assets/images/quiz_logo.png'),
          logoWidth: 100,
          loaderColor: Colors.white,
          backgroundColor: const Color.fromRGBO(148, 108, 249, 1),
          navigator: const Quiz(),
          durationInSeconds: 10,
        ),
      ),
    );
  }
}