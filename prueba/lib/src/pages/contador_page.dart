import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState(); //retorna instancia del contador

}

class _ContadorPageState extends State<ContadorPage> {
  final _estilotexto = new TextStyle(fontSize: 30);
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba'),
        centerTitle: true,
        elevation: 0.8,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Juega un poco', style: _estilotexto),
              Text('$_contador', style: _estilotexto),
            ]),
      ),
      floatingActionButton: _crearBotones()
    
    );
  }
  Widget _crearBotones(){
    
return Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
SizedBox(width:30.0),
FloatingActionButton( child: Icon(Icons.exposure_zero), onPressed: _cero),
Expanded(child: SizedBox()),
FloatingActionButton( child: Icon(Icons.remove), onPressed: _restar),
SizedBox(width:5.0),
FloatingActionButton( child: Icon(Icons.add), onPressed: _agregar),
],);   

  }
  void _agregar(){
    setState(() =>_contador++);

}
  void _restar(){
    setState(()=>_contador--);

}
  void _cero(){
    setState(() =>_contador=0);
}
}