
import 'package:flutter/material.dart';
import 'package:prueba/src/pages/contador_page.dart';
//import 'package:prueba/src/pages/home_page.dart';
class MyApp extends StatelessWidget{

  Widget build( context ){
    
return MaterialApp(
  debugShowCheckedModeBanner: false,
home: Center(
//child: HomePage(),
child: ContadorPage(),
));

  }
}