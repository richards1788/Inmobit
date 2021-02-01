import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  final estilotexto = new TextStyle( fontSize: 30);
  int contador=10; 
@override
Widget build(BuildContext context) {

  return Scaffold( 
appBar: AppBar(
  title: Text('Titulo'),
  centerTitle: true,
  elevation: 0.8,
), 
body: Center(
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text('Número de clicks', style:estilotexto),
Text('$contador', style:estilotexto),
]

),

),

floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: (){
print('Hola Mundo');
  },),
);
}
}