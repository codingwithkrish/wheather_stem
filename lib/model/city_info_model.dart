class CityInfo {
  CityInfo({
    required this.name,
    required this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  final String? name;
  static const String nameKey = "name";

  final LocalNames? localNames;
  static const String localNamesKey = "local_names";

  final double? lat;
  static const String latKey = "lat";

  final double? lon;
  static const String lonKey = "lon";

  final String? country;
  static const String countryKey = "country";

  final String? state;
  static const String stateKey = "state";

  CityInfo copyWith({
    String? name,
    LocalNames? localNames,
    double? lat,
    double? lon,
    String? country,
    String? state,
  }) {
    return CityInfo(
      name: name ?? this.name,
      localNames: localNames ?? this.localNames,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
      state: state ?? this.state,
    );
  }

  factory CityInfo.fromJson(Map<String, dynamic> json) {
    return CityInfo(
      name: json["name"],
      localNames: json["local_names"] == null
          ? null
          : LocalNames.fromJson(json["local_names"]),
      lat: json["lat"],
      lon: json["lon"],
      country: json["country"],
      state: json["state"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "local_names": localNames?.toJson(),
        "lat": lat,
        "lon": lon,
        "country": country,
        "state": state,
      };

  @override
  String toString() {
    return "$name, $localNames, $lat, $lon, $country, $state, ";
  }
}

class LocalNames {
  LocalNames({
    required this.hi,
    required this.mr,
    required this.fa,
    required this.he,
    required this.ar,
    required this.ml,
    required this.kn,
    required this.pa,
    required this.en,
    required this.zh,
    required this.te,
    required this.ru,
    required this.ur,
    required this.ps,
  });

  final String? hi;
  static const String hiKey = "hi";

  final String? mr;
  static const String mrKey = "mr";

  final String? fa;
  static const String faKey = "fa";

  final String? he;
  static const String heKey = "he";

  final String? ar;
  static const String arKey = "ar";

  final String? ml;
  static const String mlKey = "ml";

  final String? kn;
  static const String knKey = "kn";

  final String? pa;
  static const String paKey = "pa";

  final String? en;
  static const String enKey = "en";

  final String? zh;
  static const String zhKey = "zh";

  final String? te;
  static const String teKey = "te";

  final String? ru;
  static const String ruKey = "ru";

  final String? ur;
  static const String urKey = "ur";

  final String? ps;
  static const String psKey = "ps";

  LocalNames copyWith({
    String? hi,
    String? mr,
    String? fa,
    String? he,
    String? ar,
    String? ml,
    String? kn,
    String? pa,
    String? en,
    String? zh,
    String? te,
    String? ru,
    String? ur,
    String? ps,
  }) {
    return LocalNames(
      hi: hi ?? this.hi,
      mr: mr ?? this.mr,
      fa: fa ?? this.fa,
      he: he ?? this.he,
      ar: ar ?? this.ar,
      ml: ml ?? this.ml,
      kn: kn ?? this.kn,
      pa: pa ?? this.pa,
      en: en ?? this.en,
      zh: zh ?? this.zh,
      te: te ?? this.te,
      ru: ru ?? this.ru,
      ur: ur ?? this.ur,
      ps: ps ?? this.ps,
    );
  }

  factory LocalNames.fromJson(Map<String, dynamic> json) {
    return LocalNames(
      hi: json["hi"],
      mr: json["mr"],
      fa: json["fa"],
      he: json["he"],
      ar: json["ar"],
      ml: json["ml"],
      kn: json["kn"],
      pa: json["pa"],
      en: json["en"],
      zh: json["zh"],
      te: json["te"],
      ru: json["ru"],
      ur: json["ur"],
      ps: json["ps"],
    );
  }

  Map<String, dynamic> toJson() => {
        "hi": hi,
        "mr": mr,
        "fa": fa,
        "he": he,
        "ar": ar,
        "ml": ml,
        "kn": kn,
        "pa": pa,
        "en": en,
        "zh": zh,
        "te": te,
        "ru": ru,
        "ur": ur,
        "ps": ps,
      };

  @override
  String toString() {
    return "$hi, $mr, $fa, $he, $ar, $ml, $kn, $pa, $en, $zh, $te, $ru, $ur, $ps, ";
  }
}
