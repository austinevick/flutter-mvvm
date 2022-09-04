import 'package:flutter/material.dart';
import 'custom_button.dart';

class WeatherErrorWidget extends StatelessWidget {
  final VoidCallback onTap;
  const WeatherErrorWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'Oops!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          const Text(
            'Something went wrong. Please try again.',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Retry',
            radius: 80,
            height: 50,
            width: 150,
            onPressed: onTap,
            borderSide: const BorderSide(
              color: Color(0xff4eda83),
            ),
          )
        ],
      ),
    );
  }
}
