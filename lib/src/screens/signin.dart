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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/logo.png', height: 100),
                    const SizedBox(height: 20),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 24, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // Google Sign-In button
              ElevatedButton.icon(
                onPressed: isSigningIn ? null : () async {
                  User? user = await _handleSignIn();
                  if (user != null) {
                    print('Sign in successful: ${user.displayName}');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Welcome()),
                    );
                  } else {
                    print('Sign in failed: User is null');
                  }
                },
                icon: Image.asset(
                  'assets/googleicon.png',
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.g_mobiledata, size: 24),
                ),
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Terms text
              const Text(
                'By signing in, you agree to our Terms and Conditions',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}