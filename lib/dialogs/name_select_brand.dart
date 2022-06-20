import 'dart:io';
import 'package:avto_hamyon/asset.dart';
import 'package:avto_hamyon/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/simple_button.dart';

class NameSelectdialog extends StatefulWidget {
  final DateTime? date;
  final int gender;
  final String about;
  final List images;
  final Function(
    DateTime? date,
    int gender,
    String about,
    List images,
  )? callback;

  const NameSelectdialog._({
    Key? key,
    this.date,
    this.gender = 1,
    this.about = '',
    this.images = const [],
    this.callback,
  }) : super(key: key);

  static Future<void> show(
    BuildContext context, {
    DateTime? date,
    int gender = 1,
    String about = '',
    List images = const [],
    Function(
      DateTime? date,
      int gender,
      String about,
      List images,
    )?
        callback,
  }) async {
    FocusScope.of(context).unfocus();
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => NameSelectdialog._(
        date: date,
        gender: gender,
        about: about,
        images: images,
        callback: callback,
      ),
    );
  }

  @override
  State<NameSelectdialog> createState() => _NameSelectdialogState();
}

class _NameSelectdialogState extends State<NameSelectdialog> {
  late DateTime? date = widget.date;
  late int gender = widget.gender;
  late final controller = TextEditingController(text: widget.about);
  late final List images = [];

  @override
  void initState() {
    images.addAll(widget.images);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.78,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(118),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Car model',
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(height: 23),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.2),
              child: SizedBox(
                child: TextField(
                  style: GoogleFonts.roboto(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.roboto(
                        color: const Color(0x33166799), fontSize: 14),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 27),
                    prefixIcon: const Icon(CupertinoIcons.search,
                        color: Color(0x33166799)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(color: Color(0x33166799))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(color: Color(0x33166799))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(color: Color(0x33166799))),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 23),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.377,
              child: ListWheelScrollView.useDelegate(
                useMagnifier: true,
                physics: const BouncingScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, i) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.235,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: i == 0 ? 8 : 15, bottom: i == 3 ? 8 : 15),
                          child: Text(
                            'Model ${models.results![i].title}',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                      );
                    },
                    childCount: models.results!.length),
                itemExtent: 140,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: SimpleButton(
                width: MediaQuery.of(context).size.width * 0.5779,
                text: 'Choose',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                onTap: () {},
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff45E991), Color(0xff1DA55B)],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: SimpleButton(
                width: MediaQuery.of(context).size.width * 0.5779,
                text: 'Cancel',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
                onTap: () {},
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey.shade300, Colors.grey.shade400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
