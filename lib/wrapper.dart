import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telcam_app/home_screens/home.dart';

import 'authentication-screens/login.dart';
import 'models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
//    print(user);

    if(user == null){
      return LoginPage();
    }
    else {
      return MyHomeScreen(title: 'Home');
    }
    // this class contains logic wether app should open login page or home page.
    return LoginPage();
  }
}