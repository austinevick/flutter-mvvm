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
}
