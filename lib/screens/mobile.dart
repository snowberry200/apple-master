import 'package:apple/widgets/app_bar_widget.dart';
import 'package:apple/widgets/map_widgets.dart';
import 'package:apple/widgets/mobile_bottom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MenuItem { signin, createanappleid, faq }

class MobileScreen extends StatefulWidget {
  const MobileScreen({
    super.key,
  });

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  MapWidgets mapWidgets = MapWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CupertinoColors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
          ),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(flex: 2, child: SizedBox()),
                        Expanded(
                            flex: 3, child: mapWidgets.widgets['apple image']!),
                        Expanded(flex: 2, child: SizedBox())
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                                flex: 5,
                                child: mapWidgets.widgets['form widget']!),
                            Expanded(flex: 1, child: SizedBox()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: MobileBottomAppBar());
  }
}
