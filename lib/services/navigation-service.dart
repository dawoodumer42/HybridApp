import 'package:flutter/material.dart';
import 'package:telcam_app/screens/CustomersListScreen.dart';
import 'package:telcam_app/screens/HomeScreen.dart';
import 'package:telcam_app/screens/SearchScreen.dart';

class NavigationService {
  static navigateToHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomeScreen(
          title: 'Home',
        ),
      ),
    );
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
