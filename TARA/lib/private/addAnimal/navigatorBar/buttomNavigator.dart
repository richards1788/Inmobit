import 'package:TARA/colors/colors.dart';
import 'package:flutter/material.dart';
//import 'package:yampiDemo/@Utils/colors.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
  final ValueChanged<int> onTap;
  final int index;
  BottomNav(this.onTap, this.index);
}

class _BottomNavState extends State<BottomNav> {
  TextStyle labelTextStyle =
      TextStyle(color: DeliveryColors.green, fontWeight: FontWeight.bold);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FlatButton(
            onPressed: () {
              setState(() {
                index = 0;
              });
            },
            child: null)
      ],
    );
  }
}
