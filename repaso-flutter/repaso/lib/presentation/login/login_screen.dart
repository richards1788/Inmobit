import 'package:flutter/material.dart';
import 'package:repaso/presentation/colors.dart';
import 'package:repaso/widgets/button.dart';

const logoSize = 40.0;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible;
  String _userName = '', _password = '';
  final _formKey = GlobalKey<FormState>();
  //SignInService _signInService = SignInService();

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: logoSize,
                  left: -moreSize / 2,
                  right: -moreSize / 2,
                  height: width + moreSize,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: deliveryGradients1,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(200),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('assets/img/toro2.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    text(),
                    const SizedBox(height: 40),
                    _textUser(),
                    const SizedBox(height: 20),
                    _textPassword(),
                    const SizedBox(height: 20),
                    _singUp(),
                    const SizedBox(height: 40),
                    MyButton(
                        'Iniciar Sesión',
                        DeliveryColors.dark,
                        () => _submit()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget text() {
    return Text(
      'TARA',
      style: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(fontWeight: FontWeight.bold, color: DeliveryColors.brown),
      textAlign: TextAlign.center,
    );
  }

  Widget _textUser() {
    return TextFormField(
      scrollPadding: EdgeInsets.all(18.0),
      obscureText: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Usuario requerido';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: -5),
          labelText: "Usuario",
          prefixIcon: Icon(
            Icons.person,
            size: 26.0,
            color: DeliveryColors.brown,
          )),
      onChanged: (valor) => _userName = valor,
    );
  }

  Widget _textPassword() {
    return TextFormField(
      obscureText: passwordVisible,
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña requerida';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: -5),
          labelText: "Contraseña",
          suffixIcon: IconButton(
            icon: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
                size: 26.0,
                color: DeliveryColors.brown),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          prefixIcon:
              Icon(Icons.lock, size: 26.0, color: DeliveryColors.brown)),
      onChanged: (valor) => _password = valor,
    );
  }

  Widget _singUp() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("No tienes una cuenta?",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: 20)),
            FlatButton(
                padding: EdgeInsets.all(2.0),
                child: Text("Registrate",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                onPressed: () => Navigator.of(context).pushNamed("/signup"))
          ],
        )
      ],
    );
  }

  _submit() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => null));
    /* Map user = {"username": _userName, "password": _password};
    await _signInService.signUp(user, context); */
  }
}
