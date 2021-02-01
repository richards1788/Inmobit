import 'package:TARA/colors/colors.dart';
import 'package:TARA/public/singIn/singIn.dart';
import 'package:TARA/widgets/button.dart';
import 'package:TARA/widgets/header.dart';
import 'package:TARA/widgets/returnPage.dart';
import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  SingUp({Key key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  bool passwordVisible;
  //final _formKey = GlobalKey<FormState>();
  String _userName = '', _email = '', _password = '';
  //SignInService _signInService = SignInService();
  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: Headers()),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _lineaDivisor(),
                    const SizedBox(height: 10),
                    _textUser(),
                    const SizedBox(height: 20),
                    _textEmail(),
                    const SizedBox(height: 20),
                    _textPassword(),
                    const SizedBox(height: 50),
                    MyButton('Registrarte!!!', DeliveryColors.dark, () => null),
                    _labelQuestionSignIn(),
                    ReturnPage(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textUser() {
    return Container(
        child: TextFormField(
      scrollPadding: EdgeInsets.all(18.0),
      obscureText: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Usuario requerido';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      onChanged: (value) => _userName = value,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: -5),
          labelText: "Usuario",
          prefixIcon: Icon(
            Icons.person,
            color: DeliveryColors.brown,
          )),
    ));
  }

  Widget _textEmail(/*LoginBloc bloc*/) {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => _email = value,
        decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email, color: DeliveryColors.brown),
            errorText: null),
        //onChanged: bloc.changeEmail,
      ),
    );
  }

  Widget _textPassword(/*LoginBloc bloc*/) {
    return TextFormField(
      obscureText: passwordVisible,
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña requerida';
        }
        return null;
      },
      onChanged: (value) => _password = value,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: -5),
          labelText: "Contraseña",
          suffixIcon: IconButton(
            icon: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
                color: DeliveryColors.brown),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          prefixIcon: Icon(Icons.lock, color: DeliveryColors.brown)),
    );
  }

  Widget _labelQuestionSignIn() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tienes una cuenta?",
                style: TextStyle(
                    fontFamily: "Roboto", fontWeight: FontWeight.w300)),
            FlatButton(
                padding: EdgeInsets.all(2.0),
                child: Text("Ingresar",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SingIn()),
                  );
                })
          ],
        )
      ],
    );
  }

  Widget _lineaDivisor() {
    return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Row(
          children: <Widget>[
            Expanded(child: Divider(height: 1, color: DeliveryColors.brown)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('o',
                  style: TextStyle(
                      color: DeliveryColors.brown,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0)),
            ),
            Expanded(
                child: Divider(
              height: 1,
              color: DeliveryColors.brown,
            )),
          ],
        ));
  }
}
