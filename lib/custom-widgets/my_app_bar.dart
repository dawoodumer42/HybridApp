import 'package:flutter/material.dart';
import 'package:telcam_app/services/auth_service.dart';
import 'package:telcam_app/services/navigation_service.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final AuthService _auth = AuthService();

  MyAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        FlatButton.icon(
          onPressed: () async {
            await _auth.signOut();
            NavigationService.clearStackAndNavigateToLogin(context);
          },
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          label: Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
