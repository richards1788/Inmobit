import 'package:get/get.dart';
import 'package:getx_repaso/api/userApi.dart';
import 'package:getx_repaso/model/user.dart';
import 'package:getx_repaso/page/homePageWidgets/profilePage.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users =[];
  bool _loading = true;

  bool get loading => _loading;
  int get counter => _counter;
  List<User> get users => _users;
  @override
  void onInit() {
    super.onInit();
    print('suma');
  }

  @override 
  void onReady() {
    super.onReady();
    print('onReady');
    this.loadUser();
  }

  Future<void> loadUser() async {
    final data = await UserAPI.instance.getUsers(1);
    this._users = data;
    this._loading= false;
    update(['users']);
  }

  void increment() {
    this._counter++;
    update(['text'], _counter>=10);
  }

  Future<void> showUserProfile(User user) async{
    final result =  await Get.to(ProfilePage(),
    arguments: user,
    );
    if(result != null){
      print('result $result');
    }
  }
}
