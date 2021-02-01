import 'package:TARA/colors/colors.dart';
import 'package:flutter/material.dart';

class ReturnPage extends StatefulWidget {
  @override
  ReturnPageState createState() => ReturnPageState();
}

class ReturnPageState extends State<ReturnPage> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      highlightElevation: 0,
      child: Icon(Icons.keyboard_arrow_left,
          color: DeliveryColors.dark, size: 60),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
