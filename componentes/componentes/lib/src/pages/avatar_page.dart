import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('Fa'),
              backgroundColor: Colors.brown,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/PNG COLOR.gif'),
              radius: 30.0,
            ),
          ),
        ],
      ),
      body: Center(
          child: FadeInImage(
        image: AssetImage('assets/PNG COLOR.gif'),
        placeholder: AssetImage('assets/original.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      )),
      floatingActionButton: FloatingActionButton(
        //regresar a pantalla anterior
        child: Icon(Icons.add_to_home_screen),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
