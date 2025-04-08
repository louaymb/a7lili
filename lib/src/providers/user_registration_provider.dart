// providers/user_registration_provider.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:a7lili/src/models/user_registration_data.dart';

class UserRegistrationProvider with ChangeNotifier {
  final FirebaseFirestore _firestore;
  UserRegistrationData _userData = UserRegistrationData(
    userId: 'temp-id',
    name: 'temp-name',
    email: 'temp@email.com',
    gender: 'Prefer not to say',
    position: 'Member',
    keyArea: 'Unknown',
  );

  UserRegistrationProvider(this._firestore);

  UserRegistrationData get userData => _userData;

  Future<void> initializeUser(String userId) async {
    try {
      final docSnapshot = await _firestore.collection('registrations').doc(userId).get();
      if (docSnapshot.exists) {
        _userData = UserRegistrationData.fromJson(docSnapshot.data()!);
        notifyListeners();
      }
    } catch (e) {
      print("Error initializing user: $e");
      rethrow;
    }
  }

  Future<void> loadUserData(String userId) async {
    try {
      final docSnapshot = await _firestore.collection('registrations').doc(userId).get();
      if (docSnapshot.exists) {
        _userData = UserRegistrationData.fromJson(docSnapshot.data()!);
        notifyListeners();
      }
    } catch (e) {
      print("Error loading user data: $e");
      rethrow;
    }
  }

  Future<void> updateBasicInfo({
    String? name,
    String? email,
    String? gender,
    String? position,
    String? keyArea,
  }) async {
    _userData = _userData.copyWith(
      name: name,
      email: email,
      gender: gender,
      position: position,
      keyArea: keyArea,
    );
    notifyListeners();
  }

  Future<void> updateAdditionalInfo({
    String? lc,
    String? dob,
    String? phone,
    String? emergencyPhone,
    String? cin,
    String? allergies,
    String? illnesses,
    String? singleroom,

  }) async {
    _userData = _userData.copyWith(
      lc: lc,
      dob: dob,
      phone: phone,
      emergencyPhone: emergencyPhone,
      cin: cin,
      allergies: allergies,
      illnesses: illnesses,
    );
    notifyListeners();
  }

  Future<void> saveUserData() async {
    try {
      // Ensure user has an ID
      final String userId = _userData.userId ?? const Uuid().v4();
      _userData = _userData.copyWith(userId: userId);

      await _firestore.collection('registrations').doc(userId).set(
        _userData.toJson(),
        SetOptions(merge: true),
      );
      
      print('User data saved successfully: ${_userData.toJson()}');
      notifyListeners();
    } catch (e) {
      print("Error saving user data: $e");
      rethrow;
    }
  }

  Future<void> completeRegistration() async {
    try {
      // Here you can add any final steps needed before registration is complete
      await saveUserData();
      
      // You might want to update some status field to mark registration as complete
      await _firestore.collection('registrations').doc(_userData.userId).update({
        'registrationComplete': true,
        'timestamp': FieldValue.serverTimestamp(),
      });
      
      notifyListeners();
    } catch (e) {
      print("Error completing registration: $e");
      rethrow;
    }
  }

  Future<bool> isRegistrationComplete(String userId) async {
    try {
      final doc = await _firestore.collection('registrations').doc(userId).get();
      return doc.exists && (doc.data()?['registrationComplete'] ?? false);
    } catch (e) {
      print("Error checking registration status: $e");
      return false;
    }
  }

  // Add this method to your UserRegistrationProvider class
void clearData() {
  _userData = UserRegistrationData(
    userId: 'temp-id',
    name: 'temp-name',
    email: 'temp@email.com',
    gender: 'Prefer not to say',
    position: 'Member',
    keyArea: 'Unknown',
  );
  notifyListeners();
  print('User data cleared');
}

}