import 'package:flutter/material.dart';
import 'package:mapa/mapa.dart';
import 'package:provider/provider.dart';
import 'package:mapa/direction_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => DirectionProvider(),
      child: MaterialApp(
        home: Mapa1(),
        
      ),
      create: null,
    );
  }
}


