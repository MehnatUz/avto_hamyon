import 'package:avto_hamyon/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool man = true;

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
          'Change password',
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 29, right: 20, top: 44),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Don’t use the same passwords \nthat you use.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hint: 'Old Password',
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hint: 'New password',
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hint: 'Confirm the new password',
              ),
              const SizedBox(
                height: 34,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF45E991), Color(0xFF1DA55B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.21,
                    vertical: 18),
                child: Text(
                  'Change',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot password',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff166799)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
