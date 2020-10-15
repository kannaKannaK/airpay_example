import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/launch.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/' :(context) => SplashScreen(),
      '/home' : (context) => Home()
    },
  );
  }
}