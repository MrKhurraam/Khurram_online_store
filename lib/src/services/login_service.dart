import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/login_user_model.dart';

class LoginService extends ChangeNotifier {
  LoginUserModel? _userModel;

  LoginUserModel? get loggedInUserModel => _userModel;

  LoginService() {
    Firebase.initializeApp();
  }

  Future<bool> signInWithGoogle() async {
    // Trigger the authentication flow
    // GoogleSignIn googleSignIn = GoogleSignIn();
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return false;
    }

    // Obtain the auth detail from request
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    // create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    UserCredential userCreds = await FirebaseAuth.instance.signInWithCredential(
        credential);

    if (userCreds != null) {
      print("user cred = $userCreds");
      _userModel = LoginUserModel(displayName: "${userCreds.user!.displayName}",
          photoUrl: userCreds.user?.photoURL,
          email: "${userCreds.user!.email}");
    }
    return true;
  }

  void signOut() async{
    await GoogleSignIn().signOut();
    _userModel=null;
  }


}
