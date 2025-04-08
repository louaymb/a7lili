import 'package:flutter/material.dart';
import 'signin.dart'; // Import SignInPage

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  double _opacity = 0.0; // Start with invisible

  @override
  void initState() {
    super.initState();
    
    // Trigger fade-in animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // After 6 seconds, navigate to SignInPage
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background (optional, but keeps it dark)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            height: MediaQuery.of(context).size.height, // Match screen height
          ),

          // Dragon Image (Positioned correctly)
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.15,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 3), // Fade in over 3 seconds
              opacity: _opacity,
              child: Image.asset(
                'assets/dragon.png',
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.65,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Logo Theme (Positioned correctly)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 3), // Fade in over 3 seconds
              opacity: _opacity,
              child: Image.asset(
                'assets/themelogomain1.png',
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
