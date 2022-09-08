import 'package:flutter/material.dart';
import 'package:flutter_mvvm/common/utils.dart';
import 'package:flutter_mvvm/storage/storage.dart';
import 'package:flutter_mvvm/view/home_view/home_view.dart';
import 'package:flutter_mvvm/view/landing_view/landing_view_model.dart';
import 'package:flutter_mvvm/widget/button_loader.dart';
import 'package:flutter_mvvm/widget/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final storage = ref.read(storageProvider);
      return Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('images/img1.png', height: 200),
              const SizedBox(height: 50),
              const Text('Weather forcast',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: 8),
              const Text('Discover the weather in your city.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                  )),
              const Spacer(),
              CustomButton(
                onPressed: () async {
                  return ref
                      .read(landingViewProvider.notifier)
                      .getUserLocation()
                      .then((value) {
                    if (value) {
                      storage.savePageValue(value);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const HomeView()));
                    }
                  });
                },
                color: const Color(0xff4eda83),
                width: double.infinity,
                radius: 80,
                text: 'Get Started',
                child: ButtonLoader(
                    isLoading: ref.watch(landingViewProvider),
                    text: 'Get Started'),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
