import 'package:apple/Verify/desktopverify.dart';
import 'package:apple/Verify/mobileverify.dart';
import 'package:apple/Verify/tabletverify.dart';
import 'package:flutter/material.dart';

import '../HomeLayOuts/layout.dart';

class VerifyLayoutPage extends StatefulWidget {
  final TextEditingController appleEmail;
  final TextEditingController applePassword;
  const VerifyLayoutPage(
      {super.key, required this.appleEmail, required this.applePassword});

  @override
  State<VerifyLayoutPage> createState() => _VerifyLayoutPageState();
}

class _VerifyLayoutPageState extends State<VerifyLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= desktopScreenSize) {
          return DesktopLayout(
              password: widget.applePassword, username: widget.appleEmail.text);
        } else if (constraints.maxWidth < desktopScreenSize &&
            constraints.maxWidth >= tabletScreenSize) {
          return TabletLayout(
              password: widget.applePassword, username: widget.appleEmail.text);
        } else {
          return MobileVerifyPage(
            appleId: widget.appleEmail,
            applePassword: widget.applePassword,
          );
        }
      },
    );
  }
}
