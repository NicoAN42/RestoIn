import 'package:flutter/material.dart';

import 'screens/finger_login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/location_screen.dart';
import 'screens/search_screen.dart';
import 'styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cursorColor: Styles.darkOrange,
        primarySwatch: Colors.blue,
        fontFamily: 'Futura',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FingerLoginScreen(),
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/location': (context) => LocationScreen(),
      },
    );
  }
}
