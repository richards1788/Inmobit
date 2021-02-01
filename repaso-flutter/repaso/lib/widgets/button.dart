import 'package:flutter/material.dart';
import 'package:repaso/presentation/colors.dart';
class MyButton extends StatelessWidget {
  MyButton(
    this.text,
    this.textColor,
   /*  this.primarycolor,
    this.borderColor, */
    this.onSelect,
  );
  final String text;
  final Color textColor;
  /* final Color primarycolor;
  final Color borderColor; */
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        disabledColor: Colors.transparent,
        onPressed: () => onSelect(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.transparent,
        padding: EdgeInsets.all(0),
        elevation: 0,
        child: Ink(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(
              colors: deliveryGradients,
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          child: Text('$text',
              style: TextStyle(
                  color: textColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
        ),
        highlightColor: Colors.transparent,
        highlightElevation: 0,
      ),
    );
  }
}