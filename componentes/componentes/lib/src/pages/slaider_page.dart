import 'package:flutter/material.dart';

class SlaiderPage extends StatefulWidget {
  @override
  _SlaiderPageState createState() => _SlaiderPageState();
}

class _SlaiderPageState extends State<SlaiderPage> {
  double _valorSleider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slaider'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                _crearSlaider(),
                _checkBox(),
                _crearSwitch(),
                Expanded(
                  child: _crearImagen(),
                )
              ],
            )));
  }

  Widget _crearSlaider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño Imagen',
      //divisions: 20,
      value: _valorSleider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null:(valor) {
        setState(() {
          _valorSleider = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
        image: AssetImage('assets/facharder.gif'),
        width: _valorSleider,
        fit: BoxFit.contain);
  }

  Widget _checkBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
  Widget _crearSwitch(){
       return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
}
