import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_repaso/model/user.dart';

class ProfileController extends GetxController {
  User _user;
  User get user => _user;

  String _inputText = '';

  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputText(String text) {
    this._inputText = text;
  }

  void goToBaackWithdata() {
    if (this._inputText.trim().length > 0) {
      Get.back();
    } else {
      Get.dialog(AlertDialog(
        title: Text('ERROR'),
        content: Text('INGRESE UN VALOR VALIDO'),
        actions: [
          FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text('ACEPTAR'))
        ],
      ),
      );
    }
  }
}
