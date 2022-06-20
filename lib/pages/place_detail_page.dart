import 'package:avto_hamyon/const.dart';
import 'package:avto_hamyon/service/models/place_model.dart';
import 'package:avto_hamyon/widgets/place_item_horizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key, required this.place}) : super(key: key);
  final Result place;

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  bool like = false;
  late YandexMapController controller;
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 0.5);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 1,
          leading: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Icon(
              Icons.menu,
              size: 28,
              color: Colors.black,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Icon(
                CupertinoIcons.search,
                size: 28,
                color: Colors.black,
              ),
            )
          ],
          centerTitle: true,
          title: Text(
            widget.place.title,
            style: GoogleFonts.roboto(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      child: Image.network(
                        widget.place.image1,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Text('loading data');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 49),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${placesCategories.results[0].title}',
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 22)),
                        const SizedBox(height: 19),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.48,
                              height: 44,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF1B76AD),
                                      Color(0xFF0F537E)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  )),
                              alignment: Alignment.center,
                              child: Text('See directions',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                            ),
                            IconButton(
                              icon: Icon(
                                CupertinoIcons.heart_fill,
                                color: like == false ? Colors.grey : Colors.red,
                                size: 28,
                              ),
                              onPressed: () {
                                setState(() {
                                  like = !like;
                                });
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 26),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 24,
                              color: Color(0x801a1a1a),
                            ),
                            const SizedBox(width: 11),
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7),
                              child: Text(
                                widget.place.addressTitle,
                                maxLines: 2,
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(
                              Icons.watch_later_outlined,
                              color: Color(0x801a1a1a),
                              size: 24,
                            ),
                            const SizedBox(width: 11),
                            Text('09:00-20:00',
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14))
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Color(0x801a1a1a),
                              size: 24,
                            ),
                            const SizedBox(width: 11),
                            Text('+998 (99) 000 00 00 ',
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14))
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 19),
                        Text(
                          'Description',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 19),
                        Text(
                          widget.place.description,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 19),
                      Text(
                        'Address',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 19),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          child: Image.asset(
                            'assets/img/fakemap.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 19),
                      Text(
                        'Ratings',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 19),
                      Row(
                        children: [
                          Text(
                            '4.5',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                          const SizedBox(width: 24),
                          RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: 28,
                            initialRating: 4.5,
                            allowHalfRating: true,
                            unratedColor: const Color(0x4dffc107),
                            itemBuilder: (_, __) => const Icon(
                              Icons.star_rate_rounded,
                              color: Color(0xffFFC107),
                            ),
                            onRatingUpdate: (_) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 34),
                      Text(
                        'Usman Saliev',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'The app is user-friendly and helps me to find any places I need! Thank developers, I use it on a daily basis to find places I need.',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      RatingBar.builder(
                        ignoreGestures: true,
                        itemSize: 20,
                        initialRating: 5,
                        allowHalfRating: true,
                        unratedColor: const Color(0x4dffc107),
                        itemBuilder: (_, __) => const Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xffFFC107),
                        ),
                        onRatingUpdate: (_) {},
                      ),
                      const SizedBox(height: 29),
                      Text(
                        'Figma designer',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'As a driver it’s great to use that app. Easier to find nearby places.',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      RatingBar.builder(
                        ignoreGestures: true,
                        itemSize: 20,
                        initialRating: 3,
                        allowHalfRating: true,
                        unratedColor: const Color(0x4dffc107),
                        itemBuilder: (_, __) => const Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xffFFC107),
                        ),
                        onRatingUpdate: (_) {},
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'See all',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 46),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Similar places',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 29),
                      const PlaceItem(),
                      const SizedBox(height: 30),
                      const PlaceItem(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
