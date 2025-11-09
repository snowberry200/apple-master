import 'package:apple/Verify/appbar_widget.dart';
import 'package:apple/widgets/apple_image.dart';
import 'package:apple/widgets/mobile_bottom_app_bar.dart';
import 'package:apple/passwordScreens/password_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MenuItem { signin, createanappleid, faq }

class PassMobileScreen extends StatefulWidget {
  final TextEditingController callback;

  const PassMobileScreen({super.key, required this.callback});

  @override
  State<PassMobileScreen> createState() => _PassMobileScreenState();
}

class _PassMobileScreenState extends State<PassMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CupertinoColors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(),
        ),
        body: SafeArea(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
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
                              Expanded(
                                  flex: 5,
                                  child: PasswordWidget(
                                    callback: widget.callback,
                                  )),
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
        ),
        bottomNavigationBar: MobileBottomAppBar());
  }
}
