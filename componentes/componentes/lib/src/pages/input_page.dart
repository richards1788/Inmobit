import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = ''; //tomar datos del input
  String _email = '';
  String _fecha;

  String _opcionSlecciona = 'Uno';
  List<String> _opciones = ['Uno', 'Dos', 'Tres'];
  TextEditingController _controlFecha = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs de texto'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _createInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearCombo(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearPersona(),
          ],
        ));
  }

  Widget _createInput() {
    // Ingreso de datos

    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre Persona',
        labelText: 'Nombre',
        helperText: 'Solo nombre',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Texto: $_nombre'),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesCombo() {
    List<DropdownMenuItem<String>> lista = List();
    _opciones.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return lista;
  }

  Widget _crearCombo() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      Expanded(
        child: DropdownButton(
            value: _opcionSlecciona,
            items: getOpcionesCombo(),
            onChanged: (opt) {
              setState(() {
                _opcionSlecciona = opt;
              });
            }),
      )
    ]);
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Obligatorio*',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Obligatorio*',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearFecha(BuildContext) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _controlFecha,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'AA/MM/DD',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context);
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime fecha = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );
    if (fecha != null) {
      setState(() {
        _fecha = fecha.toString();
        _controlFecha.text = _fecha;
      });
    }
  }
}
