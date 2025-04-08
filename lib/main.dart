// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Needed for Firestore
import 'package:provider/provider.dart';

import 'package:a7lili/src/screens/intro.dart';
import 'src/providers/user_registration_provider.dart'; // Import the provider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ✅ Create Firestore instance with custom database ID
  final firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'registrations', // 👈 your custom database name (ensure this is correct)
  );

  runApp(MyApp(firestore: firestore));
}

class MyApp extends StatelessWidget {
  final FirebaseFirestore firestore;

  const MyApp({super.key, required this.firestore});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserRegistrationProvider(firestore), // ✅ Pass firestore to provider
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue, 
          scaffoldBackgroundColor: Colors.white,  // Optional: Set default background color
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const IntroPage(), // Starting screen of the app
      ),
    );
  }
}
