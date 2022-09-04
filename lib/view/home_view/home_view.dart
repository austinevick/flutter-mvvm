import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view/home_view/home_view_model.dart';
import 'package:flutter_mvvm/widget/error_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/weather_service.dart';

final homeViewFutureProvider = FutureProvider.family(
    (ref, WidgetRef _ref) async =>
        ref.watch(homeViewModelProvider).getWeather(_ref));

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final weather = ref.watch(homeViewFutureProvider(ref));
      return Scaffold(
          body: weather.when(
              data: (data) => SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.place, size: 20),
                            Text(data.city!.name!),
                            const SizedBox(width: 4),
                            Text(data.city!.country!),
                          ],
                        ),
                      ],
                    ),
                  ),
              error: (error, trace) => WeatherErrorWidget(
                  onTap: () => ref.refresh(homeViewFutureProvider(ref))),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )));
    });
  }
}
