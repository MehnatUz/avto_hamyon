import 'package:avto_hamyon/asset.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateItem extends StatelessWidget {
  const CreateItem({
    Key? key,
    required this.img,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final String img;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.width * 0.35,
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //   alignment: Alignment.bottomLeft,
              //   image: AssetImage(img),
              // ),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  img,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: Color(0xff196FA4),
                    size: 26,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.3),
                    child: Text(
                      text,
                      maxLines: 2,
                      style: GoogleFonts.openSans(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
