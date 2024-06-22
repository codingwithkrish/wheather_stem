class WeekForecast {
  WeekForecast({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
    required this.alerts,
  });

  final double? lat;
  static const String latKey = "lat";

  final double? lon;
  static const String lonKey = "lon";

  final String? timezone;
  static const String timezoneKey = "timezone";

  final int? timezoneOffset;
  static const String timezoneOffsetKey = "timezone_offset";

  final Current? current;
  static const String currentKey = "current";

  final List<Daily> daily;
  static const String dailyKey = "daily";

  final List<Alert> alerts;
  static const String alertsKey = "alerts";

  WeekForecast copyWith({
    double? lat,
    double? lon,
    String? timezone,
    int? timezoneOffset,
    Current? current,
    List<Daily>? daily,
    List<Alert>? alerts,
  }) {
    return WeekForecast(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
      timezoneOffset: timezoneOffset ?? this.timezoneOffset,
      current: current ?? this.current,
      daily: daily ?? this.daily,
      alerts: alerts ?? this.alerts,
    );
  }

  factory WeekForecast.fromJson(Map<String, dynamic> json) {
    return WeekForecast(
      lat: json["lat"],
      lon: json["lon"],
      timezone: json["timezone"],
      timezoneOffset: json["timezone_offset"],
      current:
          json["current"] == null ? null : Current.fromJson(json["current"]),
      daily: json["daily"] == null
          ? []
          : List<Daily>.from(json["daily"]!.map((x) => Daily.fromJson(x))),
      alerts: json["alerts"] == null
          ? []
          : List<Alert>.from(json["alerts"]!.map((x) => Alert.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current?.toJson(),
        "daily": daily.map((x) => x?.toJson()).toList(),
        "alerts": alerts.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$lat, $lon, $timezone, $timezoneOffset, $current, $daily, $alerts, ";
  }
}

class Alert {
  Alert({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
    required this.tags,
  });

  final String? senderName;
  static const String senderNameKey = "sender_name";

  final String? event;
  static const String eventKey = "event";

  final int? start;
  static const String startKey = "start";

  final int? end;
  static const String endKey = "end";

  final String? description;
  static const String descriptionKey = "description";

  final List<String> tags;
  static const String tagsKey = "tags";

  Alert copyWith({
    String? senderName,
    String? event,
    int? start,
    int? end,
    String? description,
    List<String>? tags,
  }) {
    return Alert(
      senderName: senderName ?? this.senderName,
      event: event ?? this.event,
      start: start ?? this.start,
      end: end ?? this.end,
      description: description ?? this.description,
      tags: tags ?? this.tags,
    );
  }

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      senderName: json["sender_name"],
      event: json["event"],
      start: json["start"],
      end: json["end"],
      description: json["description"],
      tags: json["tags"] == null
          ? []
          : List<String>.from(json["tags"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "sender_name": senderName,
        "event": event,
        "start": start,
        "end": end,
        "description": description,
        "tags": tags.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$senderName, $event, $start, $end, $description, $tags, ";
  }
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });

  final int? dt;
  static const String dtKey = "dt";

  final int? sunrise;
  static const String sunriseKey = "sunrise";

  final int? sunset;
  static const String sunsetKey = "sunset";

  final double? temp;
  static const String tempKey = "temp";

  final double? feelsLike;
  static const String feelsLikeKey = "feels_like";

  final int? pressure;
  static const String pressureKey = "pressure";

  final int? humidity;
  static const String humidityKey = "humidity";

  final double? dewPoint;
  static const String dewPointKey = "dew_point";

  final double? uvi;
  static const String uviKey = "uvi";

  final int? clouds;
  static const String cloudsKey = "clouds";

  final int? visibility;
  static const String visibilityKey = "visibility";

  final double? windSpeed;
  static const String windSpeedKey = "wind_speed";

  final int? windDeg;
  static const String windDegKey = "wind_deg";

  final double? windGust;
  static const String windGustKey = "wind_gust";

  final List<Weather> weather;
  static const String weatherKey = "weather";

  Current copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    double? temp,
    double? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? uvi,
    int? clouds,
    int? visibility,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    List<Weather>? weather,
  }) {
    return Current(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      uvi: uvi ?? this.uvi,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      weather: weather ?? this.weather,
    );
  }

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      dt: json["dt"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      temp: json["temp"],
      feelsLike: json["feels_like"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"],
      uvi: double.parse(json["uvi"].toString()),
      clouds: json["clouds"],
      visibility: json["visibility"],
      windSpeed: json["wind_speed"],
      windDeg: json["wind_deg"],
      windGust: json["wind_gust"],
      weather: json["weather"] == null
          ? []
          : List<Weather>.from(
              json["weather"]!.map((x) => Weather.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": weather.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$dt, $sunrise, $sunset, $temp, $feelsLike, $pressure, $humidity, $dewPoint, $uvi, $clouds, $visibility, $windSpeed, $windDeg, $windGust, $weather, ";
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int? id;
  static const String idKey = "id";

  final String? main;
  static const String mainKey = "main";

  final String? description;
  static const String descriptionKey = "description";

  final String? icon;
  static const String iconKey = "icon";

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  @override
  String toString() {
    return "$id, $main, $description, $icon, ";
  }
}

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  final int? dt;
  static const String dtKey = "dt";

  final int? sunrise;
  static const String sunriseKey = "sunrise";

  final int? sunset;
  static const String sunsetKey = "sunset";

  final int? moonrise;
  static const String moonriseKey = "moonrise";

  final int? moonset;
  static const String moonsetKey = "moonset";

  final double? moonPhase;
  static const String moonPhaseKey = "moon_phase";

  final Temp? temp;
  static const String tempKey = "temp";

  final FeelsLike? feelsLike;
  static const String feelsLikeKey = "feels_like";

  final int? pressure;
  static const String pressureKey = "pressure";

  final int? humidity;
  static const String humidityKey = "humidity";

  final double? dewPoint;
  static const String dewPointKey = "dew_point";

  final double? windSpeed;
  static const String windSpeedKey = "wind_speed";

  final int? windDeg;
  static const String windDegKey = "wind_deg";

  final double? windGust;
  static const String windGustKey = "wind_gust";

  final List<Weather> weather;
  static const String weatherKey = "weather";

  final int? clouds;
  static const String cloudsKey = "clouds";

  final double? pop;
  static const String popKey = "pop";

  final double? rain;
  static const String rainKey = "rain";

  final double? uvi;
  static const String uviKey = "uvi";

  Daily copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    int? moonrise,
    int? moonset,
    double? moonPhase,
    Temp? temp,
    FeelsLike? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    List<Weather>? weather,
    int? clouds,
    double? pop,
    double? rain,
    double? uvi,
  }) {
    return Daily(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moonPhase: moonPhase ?? this.moonPhase,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
      uvi: uvi ?? this.uvi,
    );
  }

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: json["dt"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      moonrise: json["moonrise"],
      moonset: json["moonset"],
      moonPhase: json["moon_phase"],
      temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
      feelsLike: json["feels_like"] == null
          ? null
          : FeelsLike.fromJson(json["feels_like"]),
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"],
      windSpeed: json["wind_speed"],
      windDeg: json["wind_deg"],
      windGust: json["wind_gust"],
      weather: json["weather"] == null
          ? []
          : List<Weather>.from(
              json["weather"]!.map((x) => Weather.fromJson(x))),
      clouds: json["clouds"],
      pop: double.parse(json["pop"].toString()),
      rain: double.parse(json["rain"] == null ? "0" : json["rain"].toString()),
      uvi: double.parse(json["uvi"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp?.toJson(),
        "feels_like": feelsLike?.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": weather.map((x) => x?.toJson()).toList(),
        "clouds": clouds,
        "pop": pop,
        "rain": rain,
        "uvi": uvi,
      };

  @override
  String toString() {
    return "$dt, $sunrise, $sunset, $moonrise, $moonset, $moonPhase, $temp, $feelsLike, $pressure, $humidity, $dewPoint, $windSpeed, $windDeg, $windGust, $weather, $clouds, $pop, $rain, $uvi, ";
  }
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double? day;
  static const String dayKey = "day";

  final double? night;
  static const String nightKey = "night";

  final double? eve;
  static const String eveKey = "eve";

  final double? morn;
  static const String mornKey = "morn";

  FeelsLike copyWith({
    double? day,
    double? night,
    double? eve,
    double? morn,
  }) {
    return FeelsLike(
      day: day ?? this.day,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return FeelsLike(
      day: double.parse(json["day"].toString()),
      night: double.parse(json["night"].toString()),
      eve: double.parse(json["eve"].toString()),
      morn: double.parse(json["morn"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };

  @override
  String toString() {
    return "$day, $night, $eve, $morn, ";
  }
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double? day;
  static const String dayKey = "day";

  final double? min;
  static const String minKey = "min";

  final double? max;
  static const String maxKey = "max";

  final double? night;
  static const String nightKey = "night";

  final double? eve;
  static const String eveKey = "eve";

  final double? morn;
  static const String mornKey = "morn";

  Temp copyWith({
    double? day,
    double? min,
    double? max,
    double? night,
    double? eve,
    double? morn,
  }) {
    return Temp(
      day: day ?? this.day,
      min: min ?? this.min,
      max: max ?? this.max,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
      day: json["day"],
      min: json["min"],
      max: json["max"],
      night: json["night"],
      eve: json["eve"],
      morn: json["morn"],
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };

  @override
  String toString() {
    return "$day, $min, $max, $night, $eve, $morn, ";
  }
}
