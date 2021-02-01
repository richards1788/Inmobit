import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_repaso/contollers/homeControllers.dart';

class HomeLabal extends StatelessWidget {
  const HomeLabal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'text',
      builder: (_) => Text(
        _.counter.toString(),
      ),
    );
  }
}
