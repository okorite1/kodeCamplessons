import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceStorage extends GetxService {
  late final SharedPreferences _preferences;

  Future<ServiceStorage> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  bool getIsFirstTime() {
    return _preferences.getBool('is_first_time') ?? true;
  }

  Future<void> setIsFirstTime(bool value) async {
    await _preferences.setBool('is_first_time', value);
  }
}
