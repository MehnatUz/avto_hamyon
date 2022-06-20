import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceItem extends StatefulWidget {
  const PlaceItem({Key? key}) : super(key: key);

  @override
  State<PlaceItem> createState() => _PlaceItemState();
}

class _PlaceItemState extends State<PlaceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.15,
            height: MediaQuery.of(context).size.height * 0.15,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Image.asset(
                'assets/img/fakemap.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const Icon(
                    Icons.electric_car,
                    color: Color(0x801a1a1a),
                    size: 20,
                  ),
                  const SizedBox(width: 11),
                  Text('Maintance',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14))
                ],
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: Color(0x801a1a1a),
                  ),
                  const SizedBox(width: 11),
                  Text(
                    'Tashkent, Yunusabad ',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )
                ],
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Color(0x801a1a1a),
                    size: 20,
                  ),
                  const SizedBox(width: 11),
                  Text('10:00 - 19:00',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14))
                ],
              ),
              const SizedBox(height: 9),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: Color(0xffFFC107),
                          size: 20,
                        ),
                        const SizedBox(width: 11),
                        Text('3,8 ',
                            style: GoogleFonts.roboto(
                                color: const Color(0xffFFC107),
                                fontWeight: FontWeight.w400,
                                fontSize: 14))
                      ],
                    ),
                    const Icon(
                      CupertinoIcons.heart_fill,
                      size: 20,
                      color: Color(0xffFFC107),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
