import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: CupertinoColors.white,
        leading: const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Apple ID',
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
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
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () {},
                          child: const Text('Create An Apple ID',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 11)))),
                  TextButton(
                      onPressed: () {},
                      child: const Text('FAQ',
                          style: TextStyle(color: Colors.black, fontSize: 11)))
                ],
              )),
        ],
        elevation: 2);
  }
}
