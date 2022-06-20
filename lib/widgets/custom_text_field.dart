import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.hint, required this.controller})
      : super(key: key);
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration.collapsed(
            hintText: hint,
            hintStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color(0x801a1a1a))),
      ),
    );
  }
}
