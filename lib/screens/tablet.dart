import 'package:apple/widgets/apple_image.dart';
import 'package:apple/widgets/form_widget.dart';
import 'package:apple/widgets/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabletScreen extends StatefulWidget {
  const TabletScreen({super.key});

  @override
  State<TabletScreen> createState() => _TabletScreenState();
}

class _TabletScreenState extends State<TabletScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CupertinoColors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight), child: NavBar()),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              width: width / 2,
              child: ListView(children: [
                SizedBox(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 2, child: SizedBox()),
                                Expanded(flex: 3, child: AppleImage()),
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
                                    Expanded(flex: 5, child: FormWidget()),
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
              ]),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          color: const Color.fromARGB(255, 245, 244, 244),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      'More ways to shop: find an Apple Store or other retailer near you. or call 08000480408.',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 11.0),
                    child: Text('United Kingdom',
                        style: TextStyle(
                          fontSize: 11,
                        )),
                  ),
                  Text('copy right 2022 Apple Inc. All rights reserved.',
                      style: TextStyle(
                        fontSize: 11,
                      )),
                  Text('Privacy Policy | Use of Cookies | Terms of Use |',
                      style: TextStyle(
                        fontSize: 11,
                      )),
                  Text('Sales and Refund | Legal | Site Map ',
                      style: TextStyle(
                        fontSize: 11,
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
