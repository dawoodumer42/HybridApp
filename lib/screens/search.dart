import 'package:flutter/material.dart';
import 'package:telcam_app/custom-widgets/logo.dart';
import 'package:telcam_app/custom-widgets/my_app_bar.dart';
import 'package:telcam_app/services/navigation_service.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Widget _buildTelButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          NavigationService.navigateToCustomersListScreen(context);
        },
        child: Text("TEL - ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildCustomerButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          NavigationService.navigateToCustomersListScreen(context);
        },
        child: Text("Customer Name",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildPostCodeButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          NavigationService.navigateToCustomersListScreen(context);
        },
        child: Text("Postcode",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(widget.title),
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
                  SizedBox(height: 30),
                  Text(
                    'Search for a Contract/Ticket using one of the following fields.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  _buildTelButton(),
                  SizedBox(height: 10),
                  Text('- OR -'),
                  SizedBox(height: 10),
                  _buildCustomerButton(),
                  SizedBox(height: 10),
                  Text('- OR -'),
                  SizedBox(height: 10),
                  _buildPostCodeButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
