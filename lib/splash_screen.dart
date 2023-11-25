import 'package:feedback/config/constants/app_colors.dart';
import 'package:feedback/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   Future.delayed(const Duration(seconds: 3)).then((value){
Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: AppColor.mainColor,
        value: null,
      )),
    );
  }
}