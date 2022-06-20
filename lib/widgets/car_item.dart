import 'package:avto_hamyon/asset.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarItem extends StatelessWidget {
  const CarItem(
      {Key? key,
      required this.name,
      required this.color,
      required this.image,
      required this.number})
      : super(key: key);
  final String name;
  final String color;
  final String image;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.18,
        padding:
            const EdgeInsets.only(top: 24, left: 18, right: 10, bottom: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      color,
                      maxLines: 1,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff4D565E), Color(0xff1B222E)],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 4),
                      child: Text(
                        number,
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ],
                )),
            Flexible(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Image.asset(image, fit: BoxFit.contain),
                height: double.infinity,
              ),
            ),
          ],
        ));
  }
}
