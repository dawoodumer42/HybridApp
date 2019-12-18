import 'package:flutter/material.dart';
import 'package:telcam_app/custom-widgets/logo.dart';
import 'package:telcam_app/services/navigation-service.dart';

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Widget _buildSearchButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          NavigationService.navigateToSearchScreen(context);
        },
        child: Text("Search",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
  Widget _buildCreateNewButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          // _navigateToHomeScreen();
        },
        child: Text("Create New",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LogoWidget(),
                  SizedBox(height: 30.0),
                  Text('Search for a Contract/Ticket'),
                  SizedBox(height: 10),
                  _buildSearchButton(),
                  SizedBox(height: 30,),
                  Text('Create a new Contact/Ticket'),
                  SizedBox(height: 10),
                  _buildCreateNewButton(),
                  SizedBox(height: 25.0),
                  // _buildPasswordField(),
                  SizedBox(
                    height: 35.0,
                  ),
                  // _buildLoginButton(),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
