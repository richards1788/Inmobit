
import 'package:TARA/private/addAnimal/addAnimal/homePage.dart';
import 'package:TARA/private/addAnimal/inventory/gridView.dart';
import 'package:flutter/material.dart';
import 'package:TARA/preferenceUser/userPreference.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  final prefs = new UserPreference();
  final List<Widget> _children = [
    Center(child: GridViewInventary()),
    Center(child: HomePage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(child: _children[prefs.currentIndex]),
          _navWidget2(),
        ],
      ),
    ));
  }

  Widget _navWidget2() {
    return BottomNavigationBar(
      currentIndex: prefs.currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      iconSize: 40,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.exposure),
          label: 'Inventario',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Nuevo',
        ),
      ],
      onTap: (index) {
        setState(() {
          prefs.currentIndex = index;
        });
      },
    );
  }
}
