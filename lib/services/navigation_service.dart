import 'package:flutter/material.dart';
import 'package:telcam_app/screens/customers_list.dart';
import 'package:telcam_app/screens/home.dart';
import 'package:telcam_app/screens/search.dart';

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
