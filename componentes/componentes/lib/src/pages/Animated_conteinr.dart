import 'dart:math';

import 'package:flutter/material.dart';

class AmmateContainerPage extends StatefulWidget {
  @override
  _AmmateContainerPageState createState() => _AmmateContainerPageState();
}

class _AmmateContainerPageState extends State<AmmateContainerPage> {
  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
          child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        width: _width,
        height: _heigth,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: _color,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        //regresar a pantalla anterior
        child: Icon(Icons.add_to_home_screen),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {
    final ramdom = Random();

    setState(() {
      _width = ramdom.nextInt(300).toDouble();
      _heigth = ramdom.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        ramdom.nextInt(255),
        ramdom.nextInt(255),
        ramdom.nextInt(255),
        1, //opacity
      );
      _borderRadius = new BorderRadius.circular(ramdom.nextInt(100).toDouble());
    });
  }
}
