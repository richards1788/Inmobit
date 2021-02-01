import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
     
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Facharder'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Innovamos el desarrollo transformando nuestra región'),
                const Image(image: AssetImage('assets/img/toro.png')),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                color: Colors.red,
                shape: StadiumBorder(),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Ok'),
                color: Colors.lightBlueAccent,
                shape: StadiumBorder(),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }
}
