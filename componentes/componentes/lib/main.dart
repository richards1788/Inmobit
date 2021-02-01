//import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/alerts_page.dart';
import 'package:componentes/src/roters/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Conponentes App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('es', 'ES'), // Español
        ],
        // home: HomePage(),
        initialRoute: '/',
        routes: getAplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          print('Ruta llamada: ${settings.name}');
          return MaterialPageRoute(
              builder: (BuildContext context) => AlertPage());
        });
  }
}
