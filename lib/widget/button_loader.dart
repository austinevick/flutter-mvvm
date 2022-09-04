import 'package:flutter/material.dart';

class ButtonLoader extends StatelessWidget {
  final bool isLoading;
  final String? text;
  final Color? color;
  final Color? spinnerColor;
  const ButtonLoader(
      {Key? key,
      required this.isLoading,
      required this.text,
      this.color,
      this.spinnerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Text(
            text!,
            style: TextStyle(
              color: color,
            ),
          )
        : Center(
            child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                    color: spinnerColor ?? Colors.white, strokeWidth: 2)),
          );
  }
}
