import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
        _cardTipo1(),
        SizedBox(height: 30.0),
        _cardTipo2(),
      ]),
      floatingActionButton: FloatingActionButton(
        //regresar a pantalla anterior
        child: Icon(Icons.add_to_home_screen),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Tajeta inicial'),
            subtitle: Text('tarjeta inicial para el curso de Flutter'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //alineación
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                color: Colors.blueAccent,
                textColor: Colors.white,
                shape: StadiumBorder(),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('OK'),
                color: Colors.blueAccent,
                textColor: Colors.white,
                shape: StadiumBorder(),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Container(
        child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/06/03/10/06/house-2368389_960_720.jpg'),
          placeholder: AssetImage('assets/original.gif'),
          fadeInDuration: Duration(milliseconds: 500),
          height: 300.0,
          fit: BoxFit.cover,
        ),
        Container(padding: EdgeInsets.all(10.0), child: Text('Imagen'))
      ],
    ));
    return Container(
      //personalizar imagen
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0, //extiende la sombra
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
