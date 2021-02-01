import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componente temporal'),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> crearItems() {
    List<Widget> lista = new List<Widget>();

    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    //lista corta
    var widgets = opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Algo'),
            leading: Icon(Icons.add_a_photo),
            trailing: Icon(Icons.access_time),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
    return widgets;
  }
}
