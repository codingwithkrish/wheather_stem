import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_stem/model/city_info_model.dart';
import 'package:wheather_stem/model/week_forecast.dart' as w;
import 'package:intl/intl.dart';
import '../../services/wheather/wheather_data_provider.dart';

class WeekForecast extends StatefulWidget {
  const WeekForecast({super.key});

  @override
  State<WeekForecast> createState() => _WeekForecastState();
}

class _WeekForecastState extends State<WeekForecast> {
  TextEditingController _cityController = TextEditingController();
  WeatherDataProvider _weatherDataProvider = Get.find<WeatherDataProvider>();
  w.WeekForecast? weekForecast;

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week Forecast'),
      ),
      body: SafeArea(
        child: SafeArea(
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
                          CityInfo cityInfo = await _weatherDataProvider
                              .getCityInfo(_cityController.text);
                          if (cityInfo.lat != null && cityInfo.lon != null) {
                            weekForecast =
                                await _weatherDataProvider.getWeekForecast(
                                    cityInfo.lat.toString(),
                                    cityInfo.lon.toString());
                          }
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
              if (weekForecast != null && !isLoading) ...[
                Text(
                  'Week Forecast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: weekForecast!.daily.length,
                    itemBuilder: (context, index) {
                      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                          weekForecast!.daily[index].dt! * 1000,
                          isUtc: true);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(dateTime);

                      return Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            Text('Date: $formattedDate'),
                            Text(
                                'Temperature: ${weekForecast!.daily[index].temp!.day} *K (${(weekForecast!.daily[index].temp!.day! - 273.15).toPrecision(2)} *C)'),
                            Text(
                                'Humidity: ${weekForecast!.daily[index].humidity}'),
                            Text(
                                'Wind Speed: ${weekForecast!.daily[index].windSpeed}'),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
