import 'package:apple/Verify/mobileverify.dart';
import 'package:apple/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: CupertinoColors.white,
        leading: const Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Text(
            'Apple ID',
            style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ),
        leadingWidth: 150,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SizedBox(
                width: 30,
                child: PopupMenuButton(
                    enableFeedback: false,
                    itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: MenuItem.signin,
                            child:
                                Text('Sign in', style: TextStyle(fontSize: 14)),
                          ),
                          const PopupMenuItem(
                              value: MenuItem.createanappleid,
                              child: Text('Create your Apple ID',
                                  style: TextStyle(fontSize: 14))),
                          const PopupMenuItem(
                              value: MenuItem.faq,
                              child:
                                  Text('FAQ', style: TextStyle(fontSize: 14))),
                        ],
                    onSelected: (value) {
                      if (value == MenuItem.signin) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Homepage()));
                      }
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: CupertinoColors.white,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 25,
                    )),
              )),
        ],
        elevation: 0);
  }
}
