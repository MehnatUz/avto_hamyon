import 'package:avto_hamyon/pages/car_register_page.dart';
import 'package:avto_hamyon/pages/create_place.dart';
import 'package:avto_hamyon/pages/my_cars_page.dart';
import 'package:avto_hamyon/widgets/category_item.dart';
import 'package:avto_hamyon/widgets/create_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../asset.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff0F537E), Color(0xff1B76AD)],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(top: 22, left: 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: Image.asset(textImage)),
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.22),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: Image.asset(pngCar)),
              Positioned(
                bottom: MediaQuery.of(context).size.width * 0.1,
                left: 1,
                right: 1,
                child: Column(
                  children: [
                    CreateItem(
                      img: shadowCar,
                      text: 'Add car',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => const CarRegisterPage()),
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                    CreateItem(
                      img: shadowLocation,
                      text: 'Add location',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => const CreatePlace()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
