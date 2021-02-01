import 'package:componentes/src/pages/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _username = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: logo(),
              ),

              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _nombreUsuario(),
                      SizedBox(height: 10),
                      _crearEmail(),
                      SizedBox(height: 10),
                      _crearPassword(),
                      SizedBox(height: 40),
                      _regitrarButton(), 
                      ],
                      
                  )
                  
                  ),
                  
            ],
            
          ),
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //regresar a pantalla anterior
        child: Icon(Icons.add_to_home_screen),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _nombreUsuario() {
    // Ingreso de datos
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Nombre Persona',
        labelText: 'Nombre',
        helperText: '',
        icon: Icon(Icons.account_circle, color: Colors.blue),
      ),
      onChanged: (valor) {
        setState(() {
          _username = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Email',
          helperText: 'Obligatorio*',
          icon: Icon(Icons.email, color: Colors.blue),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Obligatorio*',
          icon: Icon(Icons.vpn_key, color: Colors.blue),
        ),
        onChanged: (valor) => setState(() {
              _password = valor;
            }));
  }
}

Widget _regitrarButton() {
  return RaisedButton(
    child: Text('Crear Cuenta',     
    style: TextStyle(color: Colors.white, fontSize: 20)),
    textTheme: ButtonTextTheme.accent,
    padding: EdgeInsets.fromLTRB(60, 15, 150, 12),
    color: Colors.blue,
    shape: StadiumBorder(),
    onPressed: () {},
  );
}

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.2);
    greyWave.cubicTo(sw * 0.99, sh * 0.35, sw * 0.60, sh * 0.33, 0, sh * 0.33);
    greyWave.close();
    paint.color = Colors.blue;
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
