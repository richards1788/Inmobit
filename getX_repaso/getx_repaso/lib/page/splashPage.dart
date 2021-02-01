import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_repaso/contollers/splashController.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      dispose: (_){
        print('normal dispose');
      },
      init: SplahsController(),
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
