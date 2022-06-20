import 'package:flutter/material.dart';

class RegisterInputItem extends StatefulWidget {
  const RegisterInputItem(
      {Key? key,
      required this.controller,
      this.icon = const Icon(Icons.circle),
      this.hintText = '',
      this.mask = '',
      this.width,
      this.haseIcon = true,
      this.onTap})
      : super(key: key);
  final TextEditingController controller;
  final Widget icon;
  final bool haseIcon;
  final VoidCallback? onTap;
  final double? width;
  final String hintText;
  final String mask;

  @override
  _RegisterInputItemState createState() => _RegisterInputItemState();
}

class _RegisterInputItemState extends State<RegisterInputItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: widget.width ?? double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        alignment: Alignment.center,
        child: TextField(
          controller: widget.controller,
          textCapitalization: TextCapitalization.words,
          textAlign:
              widget.haseIcon == false ? TextAlign.start : TextAlign.start,
          decoration: InputDecoration(
            enabled: widget.onTap != null ? false : true,
            suffixIcon:
                widget.onTap != null ? const Icon(Icons.chevron_right) : null,
            prefixIcon: widget.haseIcon == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.icon,
                  )
                : null,
            hintText: widget.hintText,
            fillColor: Colors.transparent,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
/*
*  inputFormatters: [
        MaskTextInputFormatter(
          mask: "##)###-##-##",
          initialText: controller?.text,
        )
      ],
* */
