import 'package:flutter/material.dart';

//pasar icono diferente a cada lista
final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility_new,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
};

Icon getIcon(String nombreIcon) {
  return Icon(_icons[nombreIcon], color: Colors.blue);
}
