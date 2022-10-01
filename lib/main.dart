import 'package:flutter/material.dart';
import 'package:marvelgo/providers/provider.dart';
import './screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CharacterProvider()),
        ChangeNotifierProvider(create: (context) => ComicProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Character.route,
        routes: {
          SplashScreen.route: (_) => const SplashScreen(),
          HomePage.route: (_) => HomePage(),
          Character.route: (_) => const Character(),
          Comic.route: (_) => const Comic(),
        },
      ),
    );
  }
}
