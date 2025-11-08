import 'package:flutter/material.dart';

class MobileBottomAppBar extends StatelessWidget {
  const MobileBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5,
      color: const Color.fromARGB(255, 245, 244, 244),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 90,
          child: ListView(
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
    );
  }
}
