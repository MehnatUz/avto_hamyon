import 'package:avto_hamyon/asset.dart';
import 'package:avto_hamyon/const.dart';
import 'package:avto_hamyon/pages/intro_page.dart';
import 'package:avto_hamyon/service/repository/car/cars_repository.dart';
import 'package:avto_hamyon/service/repository/place/place_repository.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroSkip extends StatefulWidget {
  const IntroSkip({Key? key}) : super(key: key);

  @override
  _IntroSkipState createState() => _IntroSkipState();
}

class _IntroSkipState extends State<IntroSkip> {
  CarRepository repository = CarRepository();
  PlaceRepository repositoryPlace = PlaceRepository();
  int i = 0;
  List<String> titles = [
    'Буд в курсе состояния своего авто',
    'Решай все вопросы по авто в одном приложении',
    'Онлайн записи и чаты с сервисом'
  ];
  List<String> descriptions = [
    'сервисная книжка, отслеживание расходных материалов и их износа, анализ расходов и статистика',
    'Oт замены лампочки до сложного ремонта, ТО, cтраховки, штрафи, евакуатор и многое другое',
    'Запис на то в удобное время, чаты онлайн-поддержки и специалистов автосервиса'
  ];

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          child: Image.asset(
            imagesIntro[i],
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
          child: const Padding(
            padding: EdgeInsets.only(top: 70, left: 28),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [Color(0xff0F537E), Color(0xff1B76AD)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  titles[i],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(height: 25),
                Text(
                  descriptions[i],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white),
                ),
                const SizedBox(height: 42),
                DotsIndicator(
                  dotsCount: 3,
                  position: i.toDouble(),
                ),
                const SizedBox(height: 84),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (i == 2) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (_) => const IntroPage()),
                        );
                      } else {
                        i++;
                      }
                    });
                  },
                  child: Text(
                    'Пропустить',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void initData() async {
    print('worked here');
    brands = await repository.getCarBrands();
    models = await repository.getCarModels(1);
    places = await repositoryPlace.getPlaces();
    placesCategories = await repositoryPlace.getPlaceCategories();
    print('CATEGORIES IS ${placesCategories.count}');
  }
}
