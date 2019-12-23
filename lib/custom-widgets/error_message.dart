
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMsg;
  ErrorMessage(this.errorMsg);
  @override
  Widget build(BuildContext context) {
    return Text(
      'Error: ' + errorMsg,
      style: TextStyle(
        color: Colors.red,
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}