import 'package:flutter/material.dart';

import './screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Go',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: HomePage.route,
      routes: {
        SplashScreen.route: (_) => const SplashScreen(),
        HomePage.route: (_) => HomePage(),
      },
    );
  }
}

class MarvelGo extends StatelessWidget {
  const MarvelGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
