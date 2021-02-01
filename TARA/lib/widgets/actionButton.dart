import 'package:TARA/colors/colors.dart';
import 'package:flutter/material.dart';

class AcButton extends StatelessWidget {
  AcButton(
    this.text,
    this.textColor,
    this.onSelect,
    this.icon,
  );
  final String text;
  final Color textColor;
  final VoidCallback onSelect;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return  RaisedButton.icon(
            icon: icon,
            color: Colors.transparent,
            elevation: 0,
            highlightColor: Colors.transparent,
            highlightElevation: 0,

            //disabledElevation: 0, 

            label: Text(
              '$text',
              style: TextStyle(
                  color: textColor, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            hoverColor: DeliveryColors.green,
            onPressed: () => onSelect());
  }
}
