import 'package:flutter/material.dart';
import 'package:flutter_mvvm/common/utils.dart';
import 'package:flutter_mvvm/service/weather_service.dart';
import 'package:flutter_mvvm/view/landing_view/landing_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigatorKey,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xff17181f)),
        home: const LandingView(),
      ),
    );
  }
}