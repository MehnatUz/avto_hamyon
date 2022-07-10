import 'package:avto_hamyon/asset.dart';
import 'package:avto_hamyon/pages/car_register_page.dart';
import 'package:avto_hamyon/pages/create_place.dart';
import 'package:avto_hamyon/widgets/add_car_item.dart';
import 'package:avto_hamyon/widgets/car_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/add_card_item.dart';

class MyCarsPage extends StatefulWidget {
  const MyCarsPage({Key? key}) : super(key: key);

  @override
  _MyCarsPageState createState() => _MyCarsPageState();
}

class _MyCarsPageState extends State<MyCarsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Icon(
              CupertinoIcons.search,
              size: 36,
              color: Colors.black,
            ),
          )
        ],
        elevation: 1,
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Icon(
            Icons.menu_sharp,
            size: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xffE5E5E5),
        title: Text(
          'Добавит машину',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: GoogleFonts.roboto(color: Colors.black, fontSize: 20),
        ),
      ),
      backgroundColor: const Color(0xffE5E5E5),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: Text(
                'Tранспорт',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, i) {
                if (i == 3) {
                  return AddCarItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const CarRegisterPage()),
                      );
                    },
                  );
                } else {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: i == 0 ? 4 : 8, bottom: i == 6 ? 4 : 8),
                      child: CarItem(
                        image: cars[i],
                        color: 'Красный',
                        number: '01 A 001 AA',
                        name: carnames[i],
                      ));
                }
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: Text(
                'Bаши места',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, i) {
                  if (i == 3) {
                    return AddCardItem(
                      onTap: () {},
                      title: 'Add a car',
                    );
                  } else {
                    return Padding(
                        padding: EdgeInsets.only(
                            left: i == 0 ? 4 : 8, right: i == 6 ? 4 : 8),
                        child: AddCardItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => const CreatePlace()),
                            );
                          },
                          title: 'Add a place',
                        ));
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  List<String> carnames = ['Chevrolet Malibu', 'Daewoo Spark', 'Ferrari Dodge'];
}
