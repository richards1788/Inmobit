import 'package:TARA/colors/colors.dart';
import 'package:TARA/preferenceUser/userPreference.dart';
import 'package:TARA/private/addAnimal/addAnimal/dataAnimal.dart';
import 'package:TARA/private/addAnimal/addAnimal/dataSecundary.dart';
import 'package:TARA/widgets/button.dart';
import 'package:TARA/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final prefs = new UserPreference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _form(),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Headers(),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 20),
                  _textData(),
                  SizedBox(height: 10),
                  _progressBar(),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _addData(),
                    MyButton('Continuar', DeliveryColors.white, () => _next()),
                    SizedBox(height: 40),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  _next() {
    setState(() {
      prefs.percent += prefs.percent;
      prefs.index = prefs.index + 1;
      if (prefs.index > 2) {
        prefs.index = 2;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => null,
          ),
        );
      }
    });
  }

  _return() {
    setState(() {
      prefs.percent = prefs.percent - 25.0;
      prefs.index = prefs.index - 1;
      if (prefs.index < 0) {
        prefs.percent = 25.0;
        prefs.index = 0;
      }
      if (prefs.index == 1) {
        prefs.percent = 50.0;
      }
      if (prefs.index == 2) {
        prefs.percent = 50.0;
      }
    });
  }

  Widget _addData() {
    return Expanded(
      child: IndexedStack(
        index: prefs.index,
        children: <Widget>[
          Container(
            child: DataAnimal(),
          ),
          Container(
            child: DataSecundary(),
          ),
          Container(
              //child: Camera(),
              ),
        ],
      ),
    );
  }

  Widget _textData() {
    return Container(
      child: RaisedButton.icon(
        onPressed: () => _return(),
        icon: Icon(
          Icons.keyboard_arrow_left,
          size: 50,
          color: Colors.black,
        ),
        label: Text(
          'AGREGAR DATOS',
          style: TextStyle(
              color: DeliveryColors.dark,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        color: Colors.white10,
        elevation: 0,
        highlightElevation: 0,
        highlightColor: Colors.transparent,
      ),
    );
  }

  Widget _progressBar() {
    return RoundedProgressBar(
        height: 10.0,
        percent: prefs.percent,
        theme: RoundedProgressBarTheme.red);
  }
}
