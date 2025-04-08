import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'welcome.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSigningIn = false;

  // Handle Google Sign-In
  Future<User?> _handleSignIn() async {
    setState(() {
      isSigningIn = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        setState(() {
          isSigningIn = false;
        });
        print('Failed sign in: User canceled the sign-in');
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      setState(() {
        isSigningIn = false;
      });

      if (user != null) {
        print('Sign in successful: ${user.displayName}');
        return user;
      } else {
        print('Failed sign in: User is null');
        return null; // If no user is returned
      }
    } catch (error) {
      setState(() {
        isSigningIn = false;
      });
      print('Error signing in with Google: $error');
      print('Failed sign in: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo (Optional, you can add your logo here)
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'), // Your logo
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 50),
            // Google Sign-In button
            ElevatedButton(
              onPressed: isSigningIn ? null : () async {
                User? user = await _handleSignIn();
                if (user != null) {
  print('Sign in successful: ${user.displayName}');
  // Navigate to welcome page after successful sign-in
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Welcome()), // Ensure this is correctly set
  );
} else {
  print('Sign in failed: User is null');
}

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Google blue color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: isSigningIn
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                      'Sign in with Google',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
            ),
            SizedBox(height: 20),
            // A small text at the bottom of the screen (Optional)
            Text(
              'By signing in, you agree to our Terms and Conditions',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
