import 'package:avto_hamyon/dialogs/car_select_dialog.dart';
import 'package:avto_hamyon/dialogs/name_select_brand.dart';
import 'package:avto_hamyon/pages/category_detail/category_detail_page.dart';
import 'package:avto_hamyon/pages/my_cars_page.dart';
import 'package:avto_hamyon/widgets/simple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/item_register.dart';

class CarRegisterPage extends StatefulWidget {
  const CarRegisterPage({Key? key}) : super(key: key);

  @override
  _CarRegisterPageState createState() => _CarRegisterPageState();
}

class _CarRegisterPageState extends State<CarRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).size * 0.09,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            backgroundColor: const Color(0xffE5E5E5),
            elevation: 0.5,
            centerTitle: true,
            leading: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Icon(
                Icons.menu_sharp,
                size: 30,
                color: Colors.black,
              ),
            ),
            title: Text(
              'Add a car',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.roboto(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              Text(
                'Tранспорт',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 22),
              RegisterInputItem(
                onTap: () {
                  print('tapped first');
                  CarSelectDialog.show(context);
                },
                icon: const ImageIcon(
                  AssetImage(
                    'assets/img/car1.png',
                  ),
                ),
                controller: TextEditingController(text: 'DaeWoo'),
                hintText: 'Car name',
              ),
              const SizedBox(height: 12),
              RegisterInputItem(
                onTap: () {
                  print('tapped first');
                  NameSelectdialog.show(context);
                },
                icon: const ImageIcon(AssetImage('assets/img/car2.png')),
                controller: TextEditingController(),
                hintText: 'Car name',
              ),
              const SizedBox(height: 12),
              RegisterInputItem(
                icon: const ImageIcon(AssetImage('assets/img/number.png')),
                controller: TextEditingController(),
                hintText: 'Number',
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegisterInputItem(
                    width: MediaQuery.of(context).size.width * 0.4,
                    icon: const ImageIcon(AssetImage('assets/img/color.png')),
                    controller: TextEditingController(),
                    hintText: 'Color',
                  ),
                  RegisterInputItem(
                    width: MediaQuery.of(context).size.width * 0.4,
                    haseIcon: false,
                    controller: TextEditingController(),
                    hintText: 'YY/MM/DD',
                  ),
                ],
              ),
              const SizedBox(height: 12),
              RegisterInputItem(
                icon: const ImageIcon(
                  AssetImage(
                    'assets/img/license.png',
                  ),
                ),
                controller: TextEditingController(),
                hintText: 'Garanty',
              ),
              const SizedBox(height: 12),
              RegisterInputItem(
                icon: const ImageIcon(AssetImage('assets/img/Calendar.png')),
                controller: TextEditingController(),
                hintText: 'Insurance date',
              ),
              const SizedBox(height: 12),
              RegisterInputItem(
                icon: const ImageIcon(AssetImage('assets/img/oil.png')),
                controller: TextEditingController(),
                hintText: 'Oil name',
              ),
              const SizedBox(height: 28),
              SimpleButton(

                text: 'Add car',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => const MyCarsPage()),
                  );
                },
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff45E991), Color(0xff1DA55B)],
                ),
              ),
              const SizedBox(height: 12),
              SimpleButton(
                text: 'Discard changes',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => const MyCarsPage()),
                  );
                },
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey.shade300, Colors.grey.shade400],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
