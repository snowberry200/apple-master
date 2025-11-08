import 'package:apple/bloc/auth_bloc.dart';
import 'package:apple/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../passwordScreens/passdesktop.dart';
import '../passwordScreens/passmobile.dart';
import '../passwordScreens/passtablet.dart';

const desktopScreenSize = 1290;
const tabletScreenSize = 630;
const mobileScreenSize = 300;

class PassLayout extends StatefulWidget {
  final String email;
  const PassLayout({super.key, required this.email});

  @override
  State<PassLayout> createState() => _PassLayoutState();
}

class _PassLayoutState extends State<PassLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(database: Database()),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= desktopScreenSize) {
            return PassDesktopScreen(callback: widget.email);
          } else if (constraints.maxWidth < desktopScreenSize &&
              constraints.maxWidth >= tabletScreenSize) {
            return PassTabletScreen(callback: widget.email);
          } else {
            return PassMobileScreen(callback: widget.email);
          }
        },
      ),
    );
  }
}
