
import 'package:flutter/material.dart';

class DataSecundary extends StatefulWidget {
  @override
  _DataSecundaryState createState() => _DataSecundaryState();
}

class _DataSecundaryState extends State<DataSecundary> {
  //int index = 0;
  String _selecRace = 'Seleccine raza';
  String _selecColor = 'Seleccine color';
  String _selecMother = 'Seleccine madre';
  String _selecFather = 'Seleccione padre';
  String _selecIron = 'seleccione hierro';

  List<String> _color = ['Seleccine color', 'Negro', 'Blonco', 'Marrón'];
  List<String> _race = ['Seleccine raza', 'Holstein', 'Brahaman', 'Jersy'];
  List<String> _mother = ['Seleccine madre', 'PRosita', 'Mariposa', 'Canela'];
  List<String> _father = ['Seleccione padre', 'Emperador', 'Aladin', 'Zet'];
  List<String> _iron = ['seleccione hierro', 'BGYZ', 'KD25', 'JKL'];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      _ironA(),
                      SizedBox(height: 20),
                      _colorA(),
                      SizedBox(height: 20),
                      _raceA(),
                      SizedBox(height: 20),
                      _motherC(),
                      SizedBox(height: 20),
                      _fatherC(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

    List<DropdownMenuItem<String>> getOpcionesIron() {
    List<DropdownMenuItem<String>> listIron = List();
    _iron.forEach((opcion) {
      listIron.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return listIron;
  }

  List<DropdownMenuItem<String>> getOpcionesColor() {
    List<DropdownMenuItem<String>> listColor = List();
    _color.forEach((opcion) {
      listColor.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return listColor;
  }

  List<DropdownMenuItem<String>> getOpcionesRace() {
    List<DropdownMenuItem<String>> listRace = List();
    _race.forEach((opcion) {
      listRace.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return listRace;
  }

  List<DropdownMenuItem<String>> getOpcionesMother() {
    List<DropdownMenuItem<String>> listMother = List();
    _mother.forEach((opcion) {
      listMother.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return listMother;
  }

  List<DropdownMenuItem<String>> getOpcionesFather() {
    List<DropdownMenuItem<String>> listFather = List();
    _father.forEach((opcion) {
      listFather.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return listFather;
  }

  Widget _ironA() {
    return Row(children: <Widget>[
      SizedBox(width: 10.0),
      Expanded(
        child: DropdownButton(
            value: _selecIron,
            items: getOpcionesIron(),
            onChanged: (opt) {
              setState(() {
                _selecIron = opt;
              });
            }),
      )
    ]);
  }

  Widget _colorA() {
    return Row(children: <Widget>[
      SizedBox(width: 10.0),
      Expanded(
        child: DropdownButton(
            value: _selecColor,
            items: getOpcionesColor(),
            onChanged: (opt) {
              setState(() {
                _selecColor = opt;
              });
            }),
      )
    ]);
  }

  Widget _raceA() {
    return Row(children: <Widget>[
      SizedBox(width: 10.0),
      Expanded(
        child: DropdownButton(
            value: _selecRace,
            items: getOpcionesRace(),
            onChanged: (opt) {
              setState(() {
                _selecRace = opt;
              });
            }),
      )
    ]);
  }

  Widget _motherC() {
    return Row(children: <Widget>[
      SizedBox(width: 10.0),
      Expanded(
        child: DropdownButton(
            value: _selecMother,
            items: getOpcionesMother(),
            onChanged: (opt) {
              setState(() {
                _selecMother = opt;
              });
            }),
      )
    ]);
  }

  Widget _fatherC() {
    return Row(children: <Widget>[
      SizedBox(width: 10.0),
      Expanded(
        child: DropdownButton(
            value: _selecFather,
            items: getOpcionesFather(),
            onChanged: (opt) {
              setState(() {
                _selecFather = opt;
              });
            }),
      )
    ]);
  }
}
