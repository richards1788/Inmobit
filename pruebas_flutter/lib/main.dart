import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebas_flutter/Directionmp.dart';
import 'map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Directionm(),
      child: MaterialApp(
        title: 'flutter demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Myhomepage(),
      ),
    );
  }
}
