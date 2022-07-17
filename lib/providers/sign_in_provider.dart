
import 'package:calorie_diary/models/class_models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInProvider{



  Future<CustomUser> googleLogin() async{
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();

    if(googleUser == null) {
      return CustomUser(isSignedIn: false);
    }

    final googleAuth = await googleUser.authentication;

    OAuthCredential credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );



    return CustomUser(email: googleUser.email,
    photoUrl: googleUser.photoUrl,isSignedIn: true);

  }


   Future googleLogOut()async{
    final googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
  }


}