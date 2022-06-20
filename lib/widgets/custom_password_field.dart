import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;

  const CustomPasswordField({
    Key? key,
    this.controller,
    this.labelText,
    this.textInputAction,
    this.onEditingComplete,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: widget.margin,
      child: TextField(
        controller: widget.controller,
        scrollPadding: const EdgeInsets.all(0),
        style: GoogleFonts.roboto(),
        obscureText: obscureText,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: GoogleFonts.roboto(
            color: const Color(0xFF4A4A4A),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: GestureDetector(
            onTap: () => setState(() => obscureText = !obscureText),
            behavior: HitTestBehavior.opaque,
            child: Icon(
              obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            ),
          ),
        ),
      ),
    );
  }
}
