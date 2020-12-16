import 'package:flutter/material.dart';

import './screens/bmr_calculator_screen.dart';
import './screens/calculator_screen.dart';
import './screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.yellow,
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        CalculatorScreen.routeName: (ctx) => CalculatorScreen(),
        BmrCalculatorScreen.routeName: (ctx) => BmrCalculatorScreen(),
      },
    );
  }
}
