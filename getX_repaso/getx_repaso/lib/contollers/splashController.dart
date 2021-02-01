import 'package:get/get.dart';
import 'package:getx_repaso/page/homePage.dart';

class SplahsController extends GetxController {
  void onReady() {
    super.onReady();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.off(HomePage(), 
        transition: Transition.zoom);
      },
    );
  }
}
