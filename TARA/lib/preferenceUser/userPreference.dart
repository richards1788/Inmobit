import 'package:shared_preferences/shared_preferences.dart';


class UserPreference {
  
  static final UserPreference _instance = new UserPreference._internal();

  factory UserPreference() {
    return _instance;
  }
  
  UserPreference._internal();

  SharedPreferences _prefs;

  initPrefs() async {
     _prefs = await SharedPreferences.getInstance();
  }
  int index =0;
  double percent = 25.0;
  int currentIndex = 0;


/*  decodeJWT({String jwt}) async {
    String _tokenJWT = jwt == null ? _prefs.getString("token") : jwt;
    final user = await json.decode(
        ascii.decode(base64.decode(base64.normalize(_tokenJWT.split(".")[1]))));
    return user;
  } */

  getToken() {
     return _prefs.getString("token");
  }

  setToken(String value) {
    this._prefs.setString('token', value);
  }

}