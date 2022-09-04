class WeatherModel {
  final double latitude;
  final double longitude;
  WeatherModel({
    required this.latitude,
    required this.longitude,
  });
}

class WeatherResponseModel {
  String? cod;
  int? message;
  int? cnt;
  List<Data>? list;
  City? city;

  WeatherResponseModel(
      {this.cod, this.message, this.cnt, this.list, this.city});

  WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <Data>[];
      json['list'].forEach((v) {
        list!.add(Data.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
}

class Data {
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  // Wind? wind;

  // Sys? sys;
  DateTime? dtTxt;
  // Rain? rain;

  Data({
    //   this.main,
    this.weather,
    this.clouds,
    //  this.wind,

    // this.sys,
    this.dtTxt,
    //this.rain
  });

  Data.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    // wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;

    // sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = DateTime.parse(json['dt_txt']);
    //  rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }
}

class Main {
  num? temp;
//   num? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? seaLevel;
//   int? grndLevel;
//   int? humidity;
//   num? tempKf;

  Main({
    this.temp,
//       this.feelsLike,
//       this.tempMin,
//       this.tempMax,
//       this.pressure,
//       this.seaLevel,
//       this.grndLevel,
//       this.humidity,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
//     feelsLike = json['feels_like'];
//     tempMin = json['temp_min'];
//     tempMax = json['temp_max'];
//     pressure = json['pressure'];
//     seaLevel = json['sea_level'];
//     grndLevel = json['grnd_level'];
//     humidity = json['humidity'];
//     tempKf = json['temp_kf'];
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

// class Wind {
//   double? speed;
//   int? deg;
//   double? gust;

//   Wind({this.speed, this.deg, this.gust});

//   Wind.fromJson(Map<String, dynamic> json) {
//     speed = json['speed'];
//     deg = json['deg'];
//     gust = json['gust'];
//   }
// }

// class Sys {
//   String? pod;

//   Sys({this.pod});

//   Sys.fromJson(Map<String, dynamic> json) {
//     pod = json['pod'];
//   }
// }

// class Rain {
//   double? d3h;

//   Rain({this.d3h});

//   Rain.fromJson(Map<String, dynamic> json) {
//     d3h = json['3h'];
//   }
// }

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}
