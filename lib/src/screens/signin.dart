import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'welcome.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _authService = AuthService();
  bool isSigningIn = false;

  // Handle Google Sign-In
  Future<User?> _handleSignIn() async {
    setState(() {
      isSigningIn = true;
    });

    try {
      final User? user = await _authService.signInWithGoogle();
      
      setState(() {
        isSigningIn = false;
      });

      if (user != null) {
        print('Sign in successful: ${user.displayName}');
        return user;
      } else {
        print('Failed sign in: User is null');
        return null;
      }
    } catch (error) {
      setState(() {
        isSigningIn = false;
      });
      print('Error signing in with Google: $error');
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
                      MaterialPageRoute(builder: (context) => const Welcome()),
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
                label: const Text(
                  'Sign in with Google',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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