import 'package:flutter/material.dart';
import 'package:telcam_app/custom-widgets/my_app_bar.dart';

class CreateNewScreen extends StatefulWidget {

  final String title;
  CreateNewScreen({this.title});

  @override
  _CreateNewScreenState createState() => _CreateNewScreenState();
}

class _CreateNewScreenState extends State<CreateNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(widget.title),
      body: Center(
        child: Text('Create New'),
      ),
    );
  }
}

