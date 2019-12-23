import 'package:flutter/material.dart';
import 'package:telcam_app/custom-widgets/my_app_bar.dart';

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
      appBar: MyAppBar(widget.title),
      body: Center(
        child: Text('Customer list goes here.'),
      ),
    );
  }
}
