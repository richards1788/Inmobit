
import 'package:TARA/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const logoSize = 40.0;

class Headers extends StatefulWidget {
  Headers({Key key}) : super(key: key);

  @override
  _HeadersState createState() => _HeadersState();
}

class _HeadersState extends State<Headers> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 40.0;

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: logoSize,
          left: -moreSize,
          right: -moreSize,
          height: width - moreSize,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: deliveryGradients,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            backgroundColor: Colors.amber[700],
            radius: 30,
          ),
        ),
        Positioned(
          bottom: logoSize,
          left: moreSize,
          child: Container(
            height: 50,
            child: Image.asset('assets/img/toro2.png'),
          ),
        ),
        Positioned(
          bottom: logoSize,
          right: moreSize,
          child: Container(
            height: 120,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Image.asset('assets/img/arbol.png'),
            ),
          ),
        ),
      ],
    );
  }
}
