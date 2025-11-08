import 'package:flutter/cupertino.dart';

class AppleImage extends StatelessWidget {
  const AppleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(
        filterQuality: FilterQuality.high,
        image: AssetImage('images/app.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
