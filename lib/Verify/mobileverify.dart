import 'package:apple/Verify/appbar_widget.dart';
import 'package:apple/Verify/form_widget_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MenuItem { signin, createanappleid, faq }

class MobileVerifyPage extends StatefulWidget {
  const MobileVerifyPage({
    super.key,
  });

  @override
  State<MobileVerifyPage> createState() => _MobileVerifyPageState();
}

class _MobileVerifyPageState extends State<MobileVerifyPage> {
  TextEditingController passwordC = TextEditingController();
  TextEditingController emailC = TextEditingController();

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
          child: Center(
            child: SizedBox(
                child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 20.0,
                      right: 20,
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(children: [
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
                        VerifyFormWidget(
                          appleId: emailC,
                          applePassword: passwordC,
                        ),
                      ]),
                    ))),
          ),
        ));
  }
}
