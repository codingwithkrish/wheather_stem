import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/city_info_model.dart';
import '../../model/weather_model.dart';
import '../../model/week_forecast.dart';
import '../../view/snakbar.dart';

class WeatherDataProvider extends GetxController {
  WheatherModel? wheatherModel;
  Future<WheatherModel> getCurrentWeather(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=d12a765ef5ed9402e4d9cc10508dff8b',
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        log(res.body);
        wheatherModel = WheatherModel.fromJson(jsonDecode(res.body));
        return wheatherModel!;
      } else {
        throw Exception(jsonDecode(res.body)["message"]);
      }
    } catch (e) {
      log(e.toString());
      showSnakBar(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<CityInfo> getCityInfo(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=1&APPID=d12a765ef5ed9402e4d9cc10508dff8b',
        ),
      );
      log(res.body);
      if ((res.statusCode == 200 || res.statusCode == 201) &&
          jsonDecode(res.body).isNotEmpty) {
        CityInfo cityInfo = CityInfo.fromJson(jsonDecode(res.body)[0]);
        return cityInfo;
      } else {
        throw Exception("City not found");
      }
    } catch (e) {
      log(e.toString());
      showSnakBar(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<WeekForecast> getWeekForecast(String lat, String long) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${long}&exclude=minutely,hourly&appid=d12a765ef5ed9402e4d9cc10508dff8b',
        ),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        log(res.body);
        return WeekForecast.fromJson(jsonDecode(res.body));
      } else {
        throw Exception(jsonDecode(res.body)["message"]);
      }
    } catch (e) {
      log(e.toString());
      showSnakBar(e.toString());
      throw Exception(e.toString());
    }
  }
}
