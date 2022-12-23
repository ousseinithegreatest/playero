import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:playero/controllers/list_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      // logo: Image.asset(""),
      title: const Text(
        "PLAYERO",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 50,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.deepOrange,
      showLoader: true,
      navigator: ListController(),
      loaderColor: Colors.white,
      durationInSeconds: 5,
    );
  }
}
