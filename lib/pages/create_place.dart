import 'package:avto_hamyon/dialogs/car_select_dialog.dart';
import 'package:avto_hamyon/dialogs/custom_map_dialog.dart';
import 'package:avto_hamyon/pages/my_cars_page.dart';
import 'package:avto_hamyon/widgets/item_register.dart';
import 'package:avto_hamyon/widgets/simple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePlace extends StatefulWidget {
  const CreatePlace({Key? key}) : super(key: key);

  @override
  State<CreatePlace> createState() => _CreatePlaceState();
}

class _CreatePlaceState extends State<CreatePlace> {
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
              'Add a place',
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
                '   Title',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RegisterInputItem(
                haseIcon: false,
                controller: TextEditingController(),
                hintText: 'Title',
              ),
              const SizedBox(height: 14),
              Text(
                '   Google maps',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RegisterInputItem(
                haseIcon: false,
                controller: TextEditingController(),
                hintText: 'go to maps',
                onTap: () {
                  CustomMapDialog.show(
                    context,
                    callback: (pointCurrent, zoom, list) {},
                  );
                },
              ),
              const SizedBox(height: 14),
              Text(
                '   Location',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RegisterInputItem(
                haseIcon: false,
                controller: TextEditingController(),
                hintText: 'Choose',
                onTap: () {},
              ),
              const SizedBox(height: 14),
              Text(
                '   Working hours',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RegisterInputItem(
                haseIcon: false,
                hintText: 'Choose',
                onTap: () {},
                controller: TextEditingController(),
              ),
              const SizedBox(height: 14),
              Text(
                '   Category',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RegisterInputItem(
                onTap: () {},
                haseIcon: false,
                controller: TextEditingController(),
                hintText: 'Choose',
              ),
              const SizedBox(height: 14),
              Text(
                '   Description',
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  alignment: Alignment.center,
                  child: const TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    textCapitalization: TextCapitalization.words,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: 'Description',
                      fillColor: Colors.transparent,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SimpleButton(
                text: 'Publish',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => const MyCarsPage()),
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
                text: 'Cancel',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => const MyCarsPage()),
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
