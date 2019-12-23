import 'package:flutter/material.dart';

class HttpErrorHandler {
  // final BuildContext context;
  // HttpErrorHandler(this.context);

  static void _showDialog(BuildContext context, String msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            'Error',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static String _returnErrorMessage(int statusCode){
    String msg = '';
    if (statusCode == 400) {
      msg = 'Invalid user Email or Password.';
    } else if (statusCode == 401) {
      msg = 'Unautorized user access or token expired. Please login again.';
      // LogoutService logoutService = LogoutService(context);
      // logoutService.logout();
    }else if(statusCode == 403){
      msg = 'The request was valid but server is refusing action. Please Login again.';
      // LogoutService logoutService = LogoutService(context);
      // logoutService.logout();
    }
    else if (statusCode == 404) {
      msg = 'Not found. Service yor\'re directing to is not there.';
    } else if (statusCode == 405) {
      msg = 'Method not allowed.';
    } else if (statusCode == 406) {
      msg = 'Not acceptable.';
    } else if (statusCode == 500) {
      msg = 'Internal server error. Something happened on the server side.';
    } else if (statusCode == 501) {
      msg =
      'Not implemented. The server side does\'nt recognize the request method.';
    } else if (statusCode == 503) {
      msg =
      'The services are unaiable. The server couldn\'t handler the request.';
    } else if(statusCode == 0){
      msg = 'The service is temporarily unavailable.';
    }
    return msg;
  }

  static String textError(int statusCode) {
    String msg = _returnErrorMessage(statusCode);
    return msg;
  }

  static void dialogError(BuildContext context, int statusCode){
    String msg = _returnErrorMessage(statusCode);
    _showDialog(context, msg);
  }
}
