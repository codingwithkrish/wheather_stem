import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_stem/model/weather_model.dart';
import 'package:wheather_stem/services/local/shared_prefence.dart';
import 'package:wheather_stem/view/home/favorite_city.dart';
import 'package:wheather_stem/view/home/week_forecast.dart';
import '../../services/wheather/wheather_data_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _cityController = TextEditingController();
  WheatherModel? wheatherModel;
  WeatherDataProvider _weatherDataProvider = Get.put(WeatherDataProvider());
  LocalStoreage _localStoreage = Get.put(LocalStoreage());
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(WeekForecast());
              },
              icon: Icon(Icons.weekend)),
          IconButton(
              onPressed: () {
                Get.to(() => FavoriteCity());
              },
              icon: Icon(Icons.favorite_border))
        ],
      ),
      body: SafeArea(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            wheatherModel = await _weatherDataProvider
                                .getCurrentWeather(_cityController.text);
                            _localStoreage
                                .setFavoriteCity(_cityController.text);
                          } catch (e) {
                            log(e.toString());
                          }

                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Icon(Icons.search)),
                    hintText: 'Enter your City',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (isLoading) ...[
                  CircularProgressIndicator(),
                ],
                if (wheatherModel != null && !isLoading) ...[
                  Text(
                    "Current Weather",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('City: ${wheatherModel!.city!.name}'),
                  Text(
                      'Temperature: ${wheatherModel!.list[1].main!.temp} *K (${(wheatherModel!.list[0].main!.temp! - 273.15).toPrecision(2)} *C)'),
                  Text('Humidity: ${wheatherModel!.list[1].main!.humidity}'),
                  Text('Wind Speed: ${wheatherModel!.list[1].wind!.speed}'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hourly Weather",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: wheatherModel!.list.length,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              children: [
                                Text(' Time: ${wheatherModel!.list[i].dtTxt}'),
                                Text(
                                    'Temperature: ${wheatherModel!.list[i].main!.temp} *K (${(wheatherModel!.list[i].main!.temp! - 273.15).toPrecision(2)} *C)'),
                                Text(
                                    'Humidity: ${wheatherModel!.list[i].main!.humidity}'),
                                Text(
                                    'Wind Speed: ${wheatherModel!.list[i].wind!.speed}'),
                              ],
                            ),
                          );
                        }),
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
