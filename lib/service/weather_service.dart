import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvvm/common/api.dart';
import 'package:flutter_mvvm/model/weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:retry_bot/retry_bot.dart';

final weatherServiceProvider = Provider((ref) => WeatherServiceImpl());

abstract class WeatherService {
  Future getWeather(WeatherModel model);
}

class WeatherServiceImpl extends WeatherService {
  final _dio = Dio();
  final _client = Client();

////--------Network request with Dio--------//////
  // @override
  // Future<WeatherResponseModel> getWeather(WeatherModel model) async {
  //   final response = await _dio.get(
  //       "$baseUrl${version}forecast?lat=${model.latitude}&lon=${model.longitude}&appid=$apikey");
  //   final data = (response.data);
  //   print(data);
  //   return WeatherResponseModel.fromJson(data);
  // }

////--------Network request with http--------//////
  @override
  Future<WeatherResponseModel> getWeather(WeatherModel model) async {
    final response = await _client.get(Uri.parse(
        "$baseUrl${version}forecast?lat=${model.latitude}&lon=${model.longitude}&appid=$apikey"));
    final data = jsonDecode(response.body);
    print(data);
    return WeatherResponseModel.fromJson(data);
  }
}
