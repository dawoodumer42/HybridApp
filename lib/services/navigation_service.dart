import 'package:flutter/material.dart';
import 'package:telcam_app/authentication-screens/login.dart';
import 'package:telcam_app/home_screens//customers_list.dart';
import 'package:telcam_app/home_screens/home.dart';
import 'package:telcam_app/home_screens/search.dart';

class NavigationService {
  static navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomeScreen(
          title: 'Home',
        ),
      ),
    );
  }

  static clearStackAndNavigateToLogin(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  static navigateToSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(
          title: 'Search',
        ),
      ),
    );
  }

  static navigateToCustomersListScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomersListScreen(
          title: 'Customers',
        ),
      ),
    );
  }
}
