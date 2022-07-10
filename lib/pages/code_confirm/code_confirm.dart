import 'package:avto_hamyon/asset.dart';
import 'package:avto_hamyon/pages/code_confirm/bloc/confirm_bloc.dart';
import 'package:avto_hamyon/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeConfirmPage extends StatefulWidget {
  final String token;

  const CodeConfirmPage({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  _CodeConfirmPageState createState() => _CodeConfirmPageState();
}

class _CodeConfirmPageState extends State<CodeConfirmPage> {
  final codeController = TextEditingController();
  ConfirmBloc bloc = ConfirmBloc();

  @override
  void dispose() {
    bloc.close();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);

    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<ConfirmBloc, ConfirmState>(
        listener: (context, state) {
          if (state is CodeConfirmed) {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(builder: (_) => const HomePage()),
            );
          }
          if (state is ConfirmFailed) {
            scaffold.showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        smsVerification,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Kodni kiriting',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              controller: codeController,
                              scrollPadding: const EdgeInsets.all(0),
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                              maxLength: 4,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                counter: const SizedBox(),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                hintText: '- - - -',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (codeController.text.length == 4) {
                                  bloc.add(ConfirmPressed(
                                      codeController.text, widget.token));
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   CupertinoPageRoute(
                                  //       builder: (_) => const HomePage()),
                                  // );
                                }
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                height: 46,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff6587fb),
                                      Color(0xff2dc5fd)
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'Jo\'natish',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Kodni qayta jo\'natish',
                            style: GoogleFonts.montserrat(
                                color: const Color(0x514F4F6B),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 14),
                          Text(
                            '01:57',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFE42323),
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {},
                            behavior: HitTestBehavior.opaque,
                            child: const Icon(
                              CupertinoIcons.refresh,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
