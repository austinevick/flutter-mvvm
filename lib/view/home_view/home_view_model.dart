import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_mvvm/common/constant.dart';
import 'package:flutter_mvvm/common/utils.dart';
import 'package:flutter_mvvm/model/weather_model.dart';
import 'package:flutter_mvvm/service/weather_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final homeViewModelProvider = Provider((ref) => HomeViewModel());

class HomeViewModel {
  Future<WeatherResponseModel> getWeather(WidgetRef ref) async {
    try {
      final location = await Location.instance.getLocation();
      final model = WeatherModel(
          latitude: location.latitude!, longitude: location.longitude!);
      print(model.latitude);
      return await ref.read(weatherServiceProvider).getWeather(model);
    } on SocketException catch (_) {
      showDialogFlash(title: noConnection, content: noConnectionMessage);
      rethrow;
    } on TimeoutException catch (e) {
      showDialogFlash(title: noConnection, content: timeout);
      rethrow;
    }
  }

  String getWeatherIcons(String value) {
    switch (value) {
      case '01d':
        return 'images/clear-sky.png';
      case '02d':
        return 'images/few-clouds.png';
      case '03d':
        return 'images/scattered-clouds.png';
      case '04d':
        return 'images/broken-clouds.png';
      case '09d':
        return 'images/shower-rain.png';
      case '10d':
        return 'images/rain.png';
      case '11d':
        return 'images/thunderstorm.png';
      case '13d':
        return 'images/snow.png';
      case '50d':
        return 'images/mist.png';
      case '01n':
        return 'images/clear-sky-night.png';
      case '02n':
        return 'images/few-clouds-night.png';
      case '10n':
        return 'images/rain-night.png';
    }
    return '';
  }
}
