import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardItem extends StatelessWidget {
  const AddCardItem({Key? key, required this.onTap, required this.title})
      : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            padding:
                const EdgeInsets.only(top: 24, left: 18, right: 10, bottom: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/img/border.png',
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: 24,
                ),
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
