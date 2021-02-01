import 'package:flutter/material.dart';
import 'package:repaso/presentation/colors.dart';

import 'login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.dark,
              radius: 80,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/img/toro1.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Ganadería TARA",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: DeliveryColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
