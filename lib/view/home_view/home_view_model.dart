import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_mvvm/common/constant.dart';
import 'package:flutter_mvvm/common/utils.dart';
import 'package:flutter_mvvm/model/weather_model.dart';
import 'package:flutter_mvvm/service/weather_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final homeViewModelProvider = Provider((ref) => HomeViewModel(ref));

class HomeViewModel {
  final Ref ref;
  HomeViewModel(this.ref);

  final connectivity = Connectivity();
  Future<WeatherResponseModel> getWeather() async {
    try {
      final location = await Location.instance.getLocation();
      final result = await connectivity.checkConnectivity();
      final model = WeatherModel(
          latitude: location.latitude!, longitude: location.longitude!);
      if (result == ConnectivityResult.none) {
        return await ref
            .read(weatherServiceProvider)
            .getWeatherDataFromDevice();
      } else {
        return await ref.read(weatherServiceProvider).getWeather(model);
      }
    } on SocketException catch (_) {
      showDialogFlash(title: noConnection, content: noConnectionMessage);
      rethrow;
    } on TimeoutException catch (_) {
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
