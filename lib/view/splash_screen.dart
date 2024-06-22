import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wheather_stem/services/local/shared_prefence.dart';

import 'auth/login.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalStoreage _localStoreage = Get.put(LocalStoreage());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (_localStoreage.getLogin()) {
        Get.offAll(() => HomeScreen());
      } else {
        Get.offAll(() => Login());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome To Weather App Screen',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Lottie.network(
                  "https://lottie.host/544f56bb-b1b2-49f6-a8a6-d74426d6fa66/yQoZmyUfNL.json")
            ],
          ),
        ),
      ),
    );
  }
}
