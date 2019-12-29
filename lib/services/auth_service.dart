import 'package:firebase_auth/firebase_auth.dart';
import 'package:telcam_app/app_constants/config.dart';
import 'package:telcam_app/models/user.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser

  User _userFromFirebase(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // get firebase app key
  String getAppKey(){
    return firebase_app_key;
  }

  // get firebase app secret
  String getAppSecret(){
    return firebase_app_secret;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebase);
  }

  // sign in anonymously
  Future signInAnonymously() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in with email/password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // register user with email/password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out user
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}