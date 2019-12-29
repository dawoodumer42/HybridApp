import 'package:flutter/material.dart';
import 'package:telcam_app/custom-widgets/error_message.dart';
import 'package:telcam_app/custom-widgets/loading_bar.dart';
import 'package:telcam_app/custom-widgets/logo.dart';
import 'package:telcam_app/services/auth_service.dart';
import 'package:telcam_app/services/navigation_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double _borderRadiusValue = 32.0;

  bool _isLoading = false;
  bool _isError = false;
  String _errorMsg = '';

  final AuthService _auth = AuthService();

  String _userId= '';
  String _password = '';

//  final Map<String, dynamic> _formData = {
//    'email': null,
//    'password': null,
//  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget _buildUserIdField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'User Id',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadiusValue),
          borderSide: new BorderSide(),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      focusNode: _emailFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _emailFocus, _passwordFocus);
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'User id is required.';
        }
        return null;
      },
      onSaved: (String value) {
//        _formData['email'] = value;
        _userId = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadiusValue),
          borderSide: new BorderSide(),
        ),
      ),
      obscureText: true,
      focusNode: _passwordFocus,
      textInputAction: TextInputAction.done,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        } else if(value.length < 3){
          return 'Atleast 3 digits required.';
        }
        return null;
      },
      onSaved: (String value) {
//        _formData['password'] = value;
      _password = value;
      },
    );
  }

  Widget _buildLoginButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16.0),
        onPressed: () {
           _submitForm();
        },
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildLoadingOrButton() {
    if (_isLoading) {
      return LoadingBar();
    } else {
      return _buildLoginButton();
    }
  }

  Widget _buildErrorMessage() {
    Widget widget = Container();
    if (_isError) {
      widget = ErrorMessage(_errorMsg);
    }
    return widget;
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _resetErrors() {
    setState(() {
      _isError = false;
      _errorMsg = '';
    });
  }

  void _submitForm() async {
    _resetErrors();
    if (!_formKey.currentState.validate()) {
      return;
    }
    else{
      _toggleLoading();
      _formKey.currentState.save();

      print(_userId);
      print(_password);
//      print(_formKey.toString());
      dynamic result = await _auth.signInWithEmailAndPassword(_userId, _password);
      if(result == null){
        _toggleLoading();
        setState(() {
          _isError = true;
          _errorMsg = 'Invalid credentials.';
        });
      } else {
//        _toggleLoading();
        print ('signed in');
        print(result.uid);
        NavigationService.navigateToHomeScreen(context);
      }
    }

    // var userData =
    //     'username=${_formData['email']}&password=${_formData['password']}&grant_type=password&user_type=Customer&outlet_id=$OUTLET_ID';
    // String loginUrl = '$BASE_URL/token';
    // UserService userService = UserService();
    // userService
    //     .authenticateUser(loginUrl, userData)
    //     .then((http.Response response) {
    //   _toggleLoading();
    //   if(response.statusCode == 200 || response.statusCode == 201){
    //     TokenModel tokenModel = TokenModel.fromJson(json.decode(response.body));
    //     if(tokenModel.accessToken != null){
    //       SharedPrefs prefs = new SharedPrefs();
    //       prefs.setToken(tokenModel.accessToken);
    //       _navigateToHome();
    //     }
    //   }
    //   else{
    //     ErrorHandler errorHandler = ErrorHandler(context);
    //     setState(() {
    //       _isError = true;
    //       _errorMsg = errorHandler.textError(response.statusCode);
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    LogoWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildUserIdField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Please enter a user id & password to login to the telcam maintenance app.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildErrorMessage(),
                    _buildLoadingOrButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
