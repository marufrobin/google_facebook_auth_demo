import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_facebook_auth_demo/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    int value = 0;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.lightBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(vertical: 20)),
              // Google sign in button
              onPressed: () async {
                print("Google login button pressed...${value++}");

                signInWithGoogle(context);
              },
              icon: Image.asset(
                "images/google.png",
                scale: 30,
              ),
              label: Text(
                "LogIn with Google",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.lightBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(vertical: 20)),
              //facebook login button
              onPressed: () {
                signInWithFacebook(context);
              },
              icon: Image.asset(
                "images/fb.png",
                width: 24,
                height: 24,
              ),
              label: const Text(
                "LogIn with Facebook",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Method for Facebook Sign-in
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential fbAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential =
          await auth.signInWithCredential(fbAuthCredential);
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
        } else {
          print("New User:${userCredential.user!.displayName}");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                    imageUrl: "${userCredential.user!.photoURL}",
                    userName: "${userCredential.user!.displayName}"),
              ));
        }
      }
    } on FirebaseAuthException catch (e) {
      print("$context, ${e.message}");
    }
  }

  // Method for Google Sign-in
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser!.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
          } else {
            print("Login with user${userCredential.user!.email}");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                      imageUrl: "${userCredential.user?.photoURL}",
                      userName: "${userCredential.user?.displayName}"),
                ));
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      print("$context, ${e.message!}");
    }
  }
}
