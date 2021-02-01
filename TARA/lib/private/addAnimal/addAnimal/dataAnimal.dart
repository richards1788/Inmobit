import 'package:TARA/colors/colors.dart';
import 'package:flutter/material.dart';

class DataAnimal extends StatefulWidget {
  @override
  _DataAnimalState createState() => _DataAnimalState();
}

class _DataAnimalState extends State<DataAnimal> {
  String _username = '';
  String _lastnameuser = '';
  String _fecha;
  TextEditingController _controlFecha = new TextEditingController();
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
                      const SizedBox(
                        height: 10,
                      ),
                      _nameAnimal(),
                      SizedBox(height: 10),
                      _idAnimal(),
                      SizedBox(height: 10),
                      _weightAnimal(),
                      SizedBox(height: 10),
                      _birthDate(),
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

  Widget _nameAnimal() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Nombre animal',
        prefixIcon:
            Icon(Icons.access_alarm, color: DeliveryColors.brown),
      ),
      onChanged: (valor) {
        setState(() {
          _username = valor;
        });
      },
    );
  }

  Widget _idAnimal() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Número identificación',
        prefixIcon: Icon(Icons.people, color: DeliveryColors.brown),
      ),
      onChanged: (valor) {
        setState(() {
          _lastnameuser = valor;
        });
      },
    );
  }

    Widget _weightAnimal() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Peso al nacer',
        prefixIcon: Icon(Icons.people, color: DeliveryColors.brown),
      ),
      onChanged: (valor) {
        setState(() {
          _lastnameuser = valor;
        });
      },
    );
  }

  Widget _birthDate() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _controlFecha,
      decoration: InputDecoration(
        hintText: 'AA/MM/DD',
        labelText: 'Fecha nacimiento',
        prefixIcon: Icon(Icons.calendar_today, color: DeliveryColors.brown),
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
