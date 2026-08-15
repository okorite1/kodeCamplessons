import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceStorage extends GetxService {
  late SharedPreferences _preferences;
  // "Late: a promise the variable will be ready before use"

  Future<ServiceStorage> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this; //Returns the service itself
  }

  bool getIsFirstTime() {
    return _preferences.getBool('is_first_time') ?? true;
    //if nothing is saved, assume it's their first time (return true)
  }

  Future<void> setIsfirstTime(bool value) async {
    await _preferences.setBool('is_first_time', value);
    //Saves with the key 'is_first_time', after onboarding return false
  }
}
