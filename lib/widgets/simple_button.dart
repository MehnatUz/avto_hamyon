import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {Key? key,
      this.icon,
      this.style,
      this.color,
      required this.text,
      required this.onTap,
      this.gradient,
      this.width})
      : super(key: key);
  final Widget? icon;
  final Color? color;
  final LinearGradient? gradient;
  final TextStyle? style;
  final double? width;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            gradient: gradient,
            color: color ?? const Color(0XFFF9F9F9),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(flex: 1, child: icon ?? const SizedBox()),
              Flexible(
                flex: 4,
                child: Text(
                  text,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: style ??
                      GoogleFonts.openSans(
                          fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const Flexible(
                child: SizedBox(),
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
