import 'dart:convert';
import 'dart:io';

import 'package:avto_hamyon/pages/auth/bloc/register_bloc.dart';
import 'package:avto_hamyon/pages/code_confirm/code_confirm.dart';
import 'package:avto_hamyon/pages/home_page.dart';
import 'package:avto_hamyon/widgets/custom_button.dart';
import 'package:avto_hamyon/widgets/custom_password_field.dart';
import 'package:avto_hamyon/widgets/custom_phone_field.dart';
import 'package:avto_hamyon/widgets/custom_textfield.dart';
import 'package:avto_hamyon/widgets/simple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_device_id/platform_device_id.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final bloc = RegisterBloc();

  var imageString = '';
  File image = File('assets/change.png');

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerReinputPassword = TextEditingController();
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerAdress = TextEditingController();

  @override
  void dispose() {
    controllerName.dispose();
    controllerPhone.dispose();
    controllerAdress.dispose();
    super.dispose();
  }

  Future<void> initPlatformState() async {
    String? deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = DateTime.now().toString();
    }
    if (!mounted) return;
  }

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    String userUrl = '';
    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterFailed) {
                scaffold.showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(state.error),
                  ),
                );
              }
              if (state is RegisterLoaded) {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => CodeConfirmPage(
                      token: state.response.token,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (kDebugMode) {
                print('STATE IS $state');
              }
              if (state is RegisterLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40.0, right: 40, top: 40),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Registratsiya',
                              style: GoogleFonts.roboto(
                                fontSize: 32,
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextField(
                              icon: Icons.alternate_email,
                              controller: controllerEmail,
                              hintText: 'E-mail (Login)',
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              textSize: 16,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 15),
                            CustomPasswordField(
                              controller: controllerPassword,
                              labelText: 'parol',
                              textInputAction: TextInputAction.done,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                            ),
                            const SizedBox(height: 15),
                            CustomPasswordField(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              controller: controllerReinputPassword,
                              labelText: 'parolni takrorlang',
                              textInputAction: TextInputAction.done,
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              icon: Icons.person,
                              controller: controllerName,
                              hintText: 'username',
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              textSize: 16,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 15),
                            CustomPhoneTextField(
                              icon: Icons.phone,
                              controller: controllerPhone,
                              hintText: 'telefon raqam',
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              textSize: 16,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: SimpleButton(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff0F537E), Color(0xff1B76AD)],
                            ),
                            style: GoogleFonts.openSans(color: Colors.white),
                            text: 'Davom etish',
                            onTap: () {
                              if (controllerPassword.text ==
                                  controllerReinputPassword.text) {
                                if (controllerName.text.isNotEmpty &&
                                    controllerEmail.text.isNotEmpty &&
                                    controllerPassword.text.isNotEmpty &&
                                    controllerReinputPassword.text.isNotEmpty &&
                                    controllerPhone.text.isNotEmpty) {
                                  bloc.add(RegisterPressed(
                                      controllerEmail.text,
                                      controllerPhone.text,
                                      controllerPassword.text,
                                      controllerName.text));
                                } else {
                                  scaffold.showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content:
                                          Text('Iltimos maydonlarni toldiring'),
                                    ),
                                  );
                                }
                              } else {
                                scaffold.showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.redAccent,
                                    content: Text('parollar mos kelmaydi'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
