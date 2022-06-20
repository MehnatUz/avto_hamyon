import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonColors { blue, white }

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final double textSize;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final ButtonColors color;
  final double opacity;

  const CustomButton({
    Key? key,
    this.width,
    this.height,
    this.text = "",
    this.textSize = 18,
    this.margin,
    this.onTap,
    this.color = ButtonColors.white,
    this.opacity = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: color == ButtonColors.white
              ? Colors.white.withOpacity(opacity)
              : Colors.blue.withOpacity(opacity),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color == ButtonColors.blue
                  ? const Color(0xFF7CACFC).withOpacity(opacity)
                  : const Color(0x90C9D5E8).withOpacity(opacity),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            color: color == ButtonColors.white ? Colors.black : Colors.white,
            fontSize: textSize,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
