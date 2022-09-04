import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final double radius;
  final TextStyle? textStyle;
  final List<Color>? gradient;
  final BorderSide? borderSide;
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.textStyle,
      this.text,
      this.color,
      this.child,
      this.width = double.infinity,
      this.height,
      this.gradient = const [Colors.transparent, Colors.transparent],
      this.borderSide,
      this.radius = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      width: width,
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: gradient!)),
        child: MaterialButton(
          onPressed: onPressed,
          color: color,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: borderSide ?? BorderSide.none),
          child: child ??
              Text(text!,
                  style: textStyle ??
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
