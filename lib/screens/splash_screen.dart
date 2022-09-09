import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../screens/screens.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, HomePage.route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 29, 36, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 170,
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/marvel.png'),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    'G  ',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                      color: Colors.yellow,
                      fontFamily: 'PermanentMarker',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 12),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 50,
                      child:
                          Lottie.asset('./assets/images/ironman-loader.json'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
