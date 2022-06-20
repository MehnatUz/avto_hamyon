import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCarItem extends StatelessWidget {
  const AddCarItem({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
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
                  'Add a car',
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
