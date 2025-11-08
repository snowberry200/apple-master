import 'package:apple/bloc/auth_bloc.dart';
import 'package:apple/database/database.dart';
import 'package:apple/screens/desktop.dart';
import 'package:apple/screens/mobile.dart';
import 'package:apple/screens/tablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const desktopScreenSize = 1290;
const tabletScreenSize = 800;
const mobileScreenSize = 300;

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(database: Database()),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= desktopScreenSize) {
            return const DesktopScreen();
          } else if (constraints.maxWidth < desktopScreenSize &&
              constraints.maxWidth >= tabletScreenSize) {
            return const TabletScreen();
          } else {
            return const MobileScreen();
          }
        },
      ),
    );
  }
}
