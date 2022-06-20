import 'package:avto_hamyon/asset.dart';
import 'package:avto_hamyon/pages/auth/register_page.dart';
import 'package:avto_hamyon/pages/home_page.dart';
import 'package:avto_hamyon/pages/login/login_page.dart';
import 'package:avto_hamyon/widgets/simple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: Image.asset(
                introMain,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              color: Colors.black.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Добро \nпожаловать',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 28),
                    ),
                    Row(
                      children: [
                        Text(
                          'в ',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 28),
                        ),
                        Text(
                          'AvtoHamyon',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 28),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SimpleButton(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff0F537E), Color(0xff1B76AD)],
                        ),
                        icon: const ImageIcon(
                          AssetImage(addIcon),
                          size: 26,
                          color: Colors.white,
                        ),
                        text: 'Зарегистрироваться',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => const RegisterPage()),
                          );
                        },
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 18),
                      SimpleButton(
                        text: 'Bойти в аккаунт',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => const LoginPage()),
                          );
                        },
                        color: const Color(0XffF9F9F9),
                      ),
                      // const SizedBox(height: 16),
                      // SimpleButton(
                      //   icon: SizedBox(
                      //       width: 26,
                      //       height: 26,
                      //       child: Image.asset(googleIcon)),
                      //   text: 'Bойти через Google',
                      //   onTap: () {},
                      //   style: GoogleFonts.openSans(
                      //     fontWeight: FontWeight.w600,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => const HomePage()),
                          );
                        },
                        child: Text(
                          'Пропустить',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/rectangle2.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
