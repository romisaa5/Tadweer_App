import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:toda_app/core/helper/show_error.dart';
import 'package:toda_app/core/utils/app_router.dart';

class LoginMethods {
 static Future<UserCredential> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      showAwesomeDialog('Google sign-in was cancelled.', 'Cancelled', context);
      return Future.error('User cancelled Google Sign-In');
    }

    final googleAuth = await googleUser.authentication;
    print('AccessToken: ${googleAuth.accessToken}');
    print('IdToken: ${googleAuth.idToken}');

    if (googleAuth.accessToken == null || googleAuth.idToken == null) {
      showAwesomeDialog(
          'Google sign-in failed. Missing token.', 'Error', context);
      return Future.error('Google sign-in failed. Missing token.');
    }

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    GoRouter.of(context).pushReplacement(AppRouter.homeview);
    return userCredential;
  }

 static Future<UserCredential> signInWithFacebook(BuildContext context) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success &&
        loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      GoRouter.of(context).pushReplacement(AppRouter.homeview);
      return userCredential;
    } else {
      showAwesomeDialog('Facebook login failed.', 'Error', context);
      throw FirebaseAuthException(
        code: 'facebook-login-failed',
        message: loginResult.message ?? 'Unknown error occurred',
      );
    }
  }
}
