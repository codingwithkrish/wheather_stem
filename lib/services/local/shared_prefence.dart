import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreage extends GetxController {
  SharedPreferences? _prefs;
  LocalStoreage() {
    getSharedPreferences();
  }
  getSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool setLogin([bool value = true]) {
    _prefs!.setBool('isLogin', value);

    return value;
  }

  bool getLogin() {
    bool isLogin = false;
    isLogin = _prefs!.getBool('isLogin') ?? false;

    return isLogin;
  }

  void setFavoriteCity(String cityName) async {
    List<String> favoriteCity = [];
    favoriteCity = _prefs!.getStringList('favoriteCity') ?? [];
    if (favoriteCity.contains(cityName)) {
      favoriteCity.remove(cityName);
    }
    favoriteCity.add(cityName);
    log(favoriteCity.toString());
    await _prefs!.setStringList('favoriteCity', favoriteCity);
    List<String> list = _prefs!.getStringList('favoriteCity')!;
    log("Kirj" + list.toString());
  }

  List<String> getFavoriteCity() {
    List<String> favoriteCity = _prefs!.getStringList('favoriteCity')!;
    log("In");

    return favoriteCity;
  }

  removeCity(String cityName) async {
    List<String> favoriteCity = [];
    favoriteCity = _prefs!.getStringList('favoriteCity') ?? [];
    if (favoriteCity.contains(cityName)) {
      favoriteCity.remove(cityName);
    }

    log(favoriteCity.toString());
    await _prefs!.setStringList('favoriteCity', favoriteCity);
    List<String> list = _prefs!.getStringList('favoriteCity')!;
    log("Kirj" + list.toString());
  }
}
