import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSimpleDialog extends StatelessWidget {
  static bool _ignoring = true;
  static bool _canPop = false;

  final String text;
  final VoidCallback? onTapYes;
  final VoidCallback? onTapNo;
  final VoidCallback? onTapOk;

  const CustomSimpleDialog._({
    Key? key,
    required this.text,
    this.onTapYes,
    this.onTapNo,
    this.onTapOk,
  }) : super(key: key);

  static Future<void> show(
    BuildContext context, {
    required String text,
    bool ignoring = true,
    VoidCallback? onTapYes,
    VoidCallback? onTapNo,
    VoidCallback? onTapOk,
  }) async {
    FocusScope.of(context).unfocus();
    _ignoring = ignoring;
    _canPop = true;
    await showDialog(
      context: context,
      builder: (_) => CustomSimpleDialog._(
        text: text,
        onTapYes: onTapYes,
        onTapNo: onTapNo,
        onTapOk: onTapOk,
      ),
    );
  }

  static void hide(BuildContext context) {
    if (_canPop) Navigator.pop(context);
    _canPop = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!_ignoring) _canPop = false;
        return !_ignoring;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: _ignoring
              ? null
              : () {
                  if (_canPop) Navigator.pop(context);
                  _canPop = false;
                },
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 32),
                  const Divider(color: Color(0xFFCECECE)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Color(0xFFCECECE)),
                  Row(
                    children: [
                      onTapNo == null
                          ? const SizedBox()
                          : Expanded(
                              child: CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: onTapNo,
                                child: Text("yo'q"),
                              ),
                            ),
                      onTapOk == null
                          ? const SizedBox()
                          : Expanded(
                              child: CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: onTapOk,
                                child: Text("ok"),
                              ),
                            ),
                      onTapYes == null
                          ? const SizedBox()
                          : Expanded(
                              child: CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: onTapYes,
                                child: Text("ha"),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
