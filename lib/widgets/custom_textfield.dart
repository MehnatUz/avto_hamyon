import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final String hintText;
  final double textSize;
  final TextEditingController controller;
  final EdgeInsetsGeometry? margin;
  final IconData icon;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    this.width,
    this.height,
    required this.hintText,
    required this.textSize,
    this.icon = Icons.adjust,
    this.margin,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return TextField(
    //   decoration: InputDecoration(
    //     hintText: hintText,
    //     border: OutlinedBorder(),
    //   ),
    // );
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                labelText: hintText,
                labelStyle: GoogleFonts.roboto(
                  color: const Color(0xFF4A4A4A),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixStyle: GoogleFonts.roboto(),
              ),
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.roboto(
                color: Colors.black.withOpacity(0.8),
                fontSize: textSize,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
