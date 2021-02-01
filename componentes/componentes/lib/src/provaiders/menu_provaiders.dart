

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvaiders {
  List<dynamic> opciones = [];
  _MenuProvaiders() {
    //cargarData();
  }

  
  Future<List<dynamic>> cargarData() async{
   final resp = await rootBundle.loadString('data/menu_opts.json');

      Map dataMap = json.decode(resp);  
      print(dataMap['rutas']);
      opciones = dataMap['rutas'];

      return opciones;
  }
}

final menuProvaiders = new _MenuProvaiders();

