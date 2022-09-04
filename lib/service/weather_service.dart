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
  void retryWeather();
}

class WeatherServiceImpl extends WeatherService {
  final _connectivity = Connectivity();
  final _dio = Dio();
  final _client = Client();

  // @override
  // Future<WeatherResponseModel> getWeather(WeatherModel model) async {
  //   final response = await _dio.get(
  //       "$baseUrl${version}forecast?lat=${model.latitude}&lon=${model.longitude}&appid=$appid");
  //   final data = (response.data);
  //   print(data);
  //   return WeatherResponseModel.fromJson(data);
  // }

  @override
  Future<WeatherResponseModel> getWeather(WeatherModel model) async {
    final response = await _client.get(Uri.parse(
        "$baseUrl${version}forecast?lat=${model.latitude}&lon=${model.longitude}&appid=$appid"));
    final data = jsonDecode(response.body);
    print(data);
    return WeatherResponseModel.fromJson(data);
  }

  @override
  void retryWeather() {
    final request = DioConnectivityRequest(
      dio: _dio,
      connectivity: _connectivity,
    );
    final retryInterceptor = OnRetryConnection(request: request);
    _dio.interceptors.add(retryInterceptor);
  }
}
