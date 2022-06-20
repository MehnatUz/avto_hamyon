import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({Key? key, required this.icon, required this.title})
      : super(key: key);
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        width: MediaQuery.of(context).size.width * 0.254,
        height: MediaQuery.of(context).size.width * 0.254,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [Color(0xff4D565E), Color(0xff1B222E)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.21),
                child: Text(
                  title,
                  maxLines: 2,
                  style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
