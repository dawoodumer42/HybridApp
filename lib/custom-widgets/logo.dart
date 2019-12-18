import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Image.asset(
        "assets/logo.png",
        fit: BoxFit.contain,
      ),
    );
  }
}
