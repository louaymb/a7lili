import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  // Reference to both Firestore databases
  final FirebaseFirestore _registrationsDB = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'registrations'
  );
  final FirebaseFirestore _a7liliDB = FirebaseFirestore.instance;

  // Create user document in a7lili database
  Future<void> createUserDocument(User user) async {
    try {
      final userDoc = await _a7liliDB.collection('users').doc(user.uid).get();
      
      if (!userDoc.exists) {
        await _a7liliDB.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoURL': user.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
          'lastSignIn': FieldValue.serverTimestamp(),
        });
      } else {
        await _a7liliDB.collection('users').doc(user.uid).update({
          'lastSignIn': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      print('Error creating user document: $e');
      rethrow;
    }
  }

  // Handle Google Sign In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        await createUserDocument(user);
      }

      return user;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  // Handle Email/Password Sign Up
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;

      if (user != null) {
        await createUserDocument(user);
      }

      return user;
    } catch (e) {
      print('Error signing up with email/password: $e');
      return null;
    }
  }

  // Handle Email/Password Sign In
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;

      if (user != null) {
        await createUserDocument(user);
      }

      return user;
    } catch (e) {
      print('Error signing in with email/password: $e');
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}