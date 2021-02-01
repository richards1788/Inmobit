import 'package:flutter/material.dart';
import 'package:repaso/presentation/splash.dart';

void main() {
  runApp(MainThemingAndStateManagementApp());
}

class MainThemingAndStateManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}


  
  

