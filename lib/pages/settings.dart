import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0.5,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Icon(
            CupertinoIcons.back,
            size: 28,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Account',
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            radius: 42,
                            backgroundImage: NetworkImage(
                                'https://445123-1394162-1-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2021/01/Driver.jpg'),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Umaraliev Saidjabbor',
                                  maxLines: 2,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Tashkent, Uzbekistan',
                                  maxLines: 2,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: EdgeInsets.all(12),
                            child: const Icon(Icons.chevron_right),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 44,
                      ),
                      Text(
                        'Settings',
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 42, right: 23),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                backgroundColor: Color(0x1a166799),
                                child: Image(
                                  width: 23,
                                  height: 23,
                                  image: AssetImage('assets/img/language.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.133),
                              Text(
                                'Language',
                                maxLines: 2,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.11),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.2),
                                child: Text(
                                  'O\'zbek',
                                  maxLines: 2,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: EdgeInsets.all(12),
                            child: const Icon(Icons.chevron_right),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                backgroundColor: Color(0x1aFFC107),
                                child: Image(
                                  width: 23,
                                  height: 23,
                                  image: AssetImage('assets/img/lock.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.133),
                              Text(
                                'Change password',
                                maxLines: 2,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(Icons.chevron_right),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                backgroundColor: Color(0x1a34CC7A),
                                child: Image(
                                  width: 23,
                                  height: 23,
                                  image: AssetImage('assets/img/Bell_fill.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.133),
                              Text(
                                'Notifications',
                                maxLines: 2,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: EdgeInsets.all(12),
                            child: const Icon(Icons.chevron_right),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 42,
                  right: 23,
                  bottom: MediaQuery.of(context).size.height * 0.04),
              child: Row(
                children: [
                  const Image(
                    width: 24,
                    height: 24,
                    image: AssetImage('assets/img/logout.png'),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Bыйти из профиля',
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                        color: const Color(0xff166799),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
