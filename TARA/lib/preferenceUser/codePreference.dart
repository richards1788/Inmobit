import 'package:shared_preferences/shared_preferences.dart';

class CodePreference {
  
  static final CodePreference _instance = new CodePreference._internal();

  factory CodePreference() {
    return _instance;
  }
  
  CodePreference._internal();

  SharedPreferences _prefs;

  initPrefs() async {
     _prefs = await SharedPreferences.getInstance();
  }

  getCode() {
     return _prefs.getInt("code");
  }

  setCode(int value) {
    this._prefs.setInt('code', value);
  }
   getUserId() {
     return _prefs.getString("userId");
  }

  setUserId(String value) {
    this._prefs.setString('userId', value);
  }

}