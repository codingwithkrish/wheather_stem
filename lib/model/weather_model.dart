class WheatherModel {
  WheatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  final String? cod;
  static const String codKey = "cod";

  final int? message;
  static const String messageKey = "message";

  final int? cnt;
  static const String cntKey = "cnt";

  final List<ListElement> list;
  static const String listKey = "list";

  final City? city;
  static const String cityKey = "city";

  WheatherModel copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<ListElement>? list,
    City? city,
  }) {
    return WheatherModel(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
      city: city ?? this.city,
    );
  }

  factory WheatherModel.fromJson(Map<String, dynamic> json) {
    return WheatherModel(
      cod: json["cod"],
      message: json["message"],
      cnt: json["cnt"],
      list: json["list"] == null
          ? []
          : List<ListElement>.from(
              json["list"]!.map((x) => ListElement.fromJson(x))),
      city: json["city"] == null ? null : City.fromJson(json["city"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list.map((x) => x?.toJson()).toList(),
        "city": city?.toJson(),
      };

  @override
  String toString() {
    return "$cod, $message, $cnt, $list, $city, ";
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final Coord? coord;
  static const String coordKey = "coord";

  final String? country;
  static const String countryKey = "country";

  final int? population;
  static const String populationKey = "population";

  final int? timezone;
  static const String timezoneKey = "timezone";

  final int? sunrise;
  static const String sunriseKey = "sunrise";

  final int? sunset;
  static const String sunsetKey = "sunset";

  City copyWith({
    int? id,
    String? name,
    Coord? coord,
    String? country,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
      coord: coord ?? this.coord,
      country: country ?? this.country,
      population: population ?? this.population,
      timezone: timezone ?? this.timezone,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"],
      name: json["name"],
      coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
      country: json["country"],
      population: json["population"],
      timezone: json["timezone"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord?.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };

  @override
  String toString() {
    return "$id, $name, $coord, $country, $population, $timezone, $sunrise, $sunset, ";
  }
}

class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });

  final double? lat;
  static const String latKey = "lat";

  final double? lon;
  static const String lonKey = "lon";

  Coord copyWith({
    double? lat,
    double? lon,
  }) {
    return Coord(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json["lat"],
      lon: json["lon"],
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };

  @override
  String toString() {
    return "$lat, $lon, ";
  }
}

class ListElement {
  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dtTxt,
  });

  final int? dt;
  static const String dtKey = "dt";

  final Main? main;
  static const String mainKey = "main";

  final List<Weather> weather;
  static const String weatherKey = "weather";

  final Clouds? clouds;
  static const String cloudsKey = "clouds";

  final Wind? wind;
  static const String windKey = "wind";

  final int? visibility;
  static const String visibilityKey = "visibility";

  final double? pop;
  static const String popKey = "pop";

  final Rain? rain;
  static const String rainKey = "rain";

  final Sys? sys;
  static const String sysKey = "sys";

  final DateTime? dtTxt;
  static const String dtTxtKey = "dt_txt";

  ListElement copyWith({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    double? pop,
    Rain? rain,
    Sys? sys,
    DateTime? dtTxt,
  }) {
    return ListElement(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
      sys: sys ?? this.sys,
      dtTxt: dtTxt ?? this.dtTxt,
    );
  }

  factory ListElement.fromJson(Map<String, dynamic> json) {
    return ListElement(
      dt: json["dt"],
      main: json["main"] == null ? null : Main.fromJson(json["main"]),
      weather: json["weather"] == null
          ? []
          : List<Weather>.from(
              json["weather"]!.map((x) => Weather.fromJson(x))),
      clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
      wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
      visibility: json["visibility"],
      pop: double.parse(json["pop"].toString()),
      rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
      dtTxt: DateTime.tryParse(json["dt_txt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "weather": weather.map((x) => x?.toJson()).toList(),
        "clouds": clouds?.toJson(),
        "wind": wind?.toJson(),
        "visibility": visibility,
        "pop": pop,
        "rain": rain?.toJson(),
        "sys": sys?.toJson(),
        "dt_txt": dtTxt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$dt, $main, $weather, $clouds, $wind, $visibility, $pop, $rain, $sys, $dtTxt, ";
  }
}

class Clouds {
  Clouds({
    required this.all,
  });

  final int? all;
  static const String allKey = "all";

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json["all"],
    );
  }

  Map<String, dynamic> toJson() => {
        "all": all,
      };

  @override
  String toString() {
    return "$all, ";
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  final double? temp;
  static const String tempKey = "temp";

  final double? feelsLike;
  static const String feelsLikeKey = "feels_like";

  final double? tempMin;
  static const String tempMinKey = "temp_min";

  final double? tempMax;
  static const String tempMaxKey = "temp_max";

  final int? pressure;
  static const String pressureKey = "pressure";

  final int? seaLevel;
  static const String seaLevelKey = "sea_level";

  final int? grndLevel;
  static const String grndLevelKey = "grnd_level";

  final int? humidity;
  static const String humidityKey = "humidity";

  final double? tempKf;
  static const String tempKfKey = "temp_kf";

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? seaLevel,
    int? grndLevel,
    int? humidity,
    double? tempKf,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
      humidity: humidity ?? this.humidity,
      tempKf: tempKf ?? this.tempKf,
    );
  }

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json["temp"],
      feelsLike: json["feels_like"],
      tempMin: json["temp_min"],
      tempMax: json["temp_max"],
      pressure: json["pressure"],
      seaLevel: json["sea_level"],
      grndLevel: json["grnd_level"],
      humidity: json["humidity"],
      tempKf: double.parse(json["temp_kf"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };

  @override
  String toString() {
    return "$temp, $feelsLike, $tempMin, $tempMax, $pressure, $seaLevel, $grndLevel, $humidity, $tempKf, ";
  }
}

class Rain {
  Rain({
    required this.the3H,
  });

  final double? the3H;
  static const String the3HKey = "3h";

  Rain copyWith({
    double? the3H,
  }) {
    return Rain(
      the3H: the3H ?? this.the3H,
    );
  }

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      the3H: json["3h"],
    );
  }

  Map<String, dynamic> toJson() => {
        "3h": the3H,
      };

  @override
  String toString() {
    return "$the3H, ";
  }
}

class Sys {
  Sys({
    required this.pod,
  });

  final String? pod;
  static const String podKey = "pod";

  Sys copyWith({
    String? pod,
  }) {
    return Sys(
      pod: pod ?? this.pod,
    );
  }

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json["pod"],
    );
  }

  Map<String, dynamic> toJson() => {
        "pod": pod,
      };

  @override
  String toString() {
    return "$pod, ";
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

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double? speed;
  static const String speedKey = "speed";

  final int? deg;
  static const String degKey = "deg";

  final double? gust;
  static const String gustKey = "gust";

  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: double.parse(json["speed"].toString()),
      deg: json["deg"],
      gust: double.parse(json["gust"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };

  @override
  String toString() {
    return "$speed, $deg, $gust, ";
  }
}
