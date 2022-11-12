import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm/common/api.dart';
import 'package:flutter_mvvm/model/weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

final weatherServiceProvider = Provider((ref) => WeatherServiceImpl());

abstract class WeatherService {
  Future getWeather(WeatherModel model);
}

class WeatherServiceImpl extends WeatherService {
  final _client = Client();
  String filename = "weather.json";

  @override
  Future<WeatherResponseModel> getWeather(WeatherModel model) async {
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/$filename");

    final response = await _client.get(Uri.parse(
        "$baseUrl${version}forecast?lat=${model.latitude}&lon=${model.longitude}&appid=$apikey"));
    final data = jsonDecode(response.body);
    print(data);
    file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
    return WeatherResponseModel.fromJson(data);
  }

  Future<WeatherResponseModel> getWeatherDataFromDevice() async {
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/$filename");
    try {
      if (file.existsSync()) {
        final data = file.readAsStringSync();

        final json = jsonDecode(data);
        return WeatherResponseModel.fromJson(json);
      }
      return WeatherResponseModel();
    } catch (e) {
      rethrow;
    }
  }
}
