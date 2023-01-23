import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
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
              onPressed: () {},
              icon: Image.asset(
                "images/fb.png",
                width: 24,
                height: 24,
              ),
              label: Text(
                "LogIn with Facebook",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
