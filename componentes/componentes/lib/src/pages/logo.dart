import 'package:flutter/material.dart';

class logo extends StatefulWidget {
  @override
  logoState createState() => logoState();
}

class logoState extends State<logo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 35),
            child: Column(
              children: <Widget>[
                const Image(image: AssetImage('assets/Inmobit.png')),
              ],
            )));
  }
}
