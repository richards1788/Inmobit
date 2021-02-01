import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final brown = Color(0xFF5D4037);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091e);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLighGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF56388);
  static final orange = Color(0xFFFFA720);
}

List<Color> deliveryGradients = [Colors.orange, Colors.brown];
List<Color> deliveryGradients1 = [DeliveryColors.brown, DeliveryColors.orange];

final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: DeliveryColors.lightGrey,
      width: 2,
      style: BorderStyle.solid
    )
    );

final lightTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme().apply(
  bodyColor: DeliveryColors.brown,
  displayColor: DeliveryColors.brown,
),
inputDecorationTheme: InputDecorationTheme(
  border: _border,
  enabledBorder:  _border,
  focusedBorder: _border,
  hintStyle: GoogleFonts.poppins(
    color: DeliveryColors.grey,
    fontSize: 10,
  )
)




);




