import 'package:flutter/material.dart';

class CustomersListScreen extends StatefulWidget {
  CustomersListScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustomersListScreenState createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Customer list goes here.'),
      ),
    );
  }
}
