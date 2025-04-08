// providers/user_registration_provider.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:cross_file/cross_file.dart';
import 'package:a7lili/src/models/user_registration_data.dart';

class UserRegistrationProvider with ChangeNotifier {
  final FirebaseFirestore _firestore;
  final FirebaseFirestore _registrations;
  final FirebaseFirestore _a7lili;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  UserRegistrationData _userData = UserRegistrationData(
    userId: 'temp-id',
    name: 'temp-name',
    email: 'temp@email.com',
    gender: 'Prefer not to say',
    position: 'Member',
    keyArea: 'Unknown',
  );

  UserRegistrationProvider(this._firestore) : 
    _registrations = _firestore,
    _a7lili = _firestore {
    // Initialize with default Firestore instance if none provided
    if (_firestore == null) {
      _firestore = FirebaseFirestore.instance;
      _registrations = _firestore;
      _a7lili = _firestore;
    }
  }

  UserRegistrationData get userData => _userData;

  Future<void> initializeUser(String userId) async {
    try {
      final docSnapshot = await _firestore.collection('registrations').doc(userId).get();
      if (docSnapshot.exists) {
        _userData = UserRegistrationData.fromJson(docSnapshot.data()!);
      } else {
        // Initialize with default data if user doesn't exist
        _userData = _userData.copyWith(userId: userId);
      }
      notifyListeners();
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

      // Save to registrations database
      await _registrations.collection('registrations').doc(userId).set(
        _userData.toJson(),
        SetOptions(merge: true),
      );

      // Create or update user document in a7lili database
      await _a7lili.collection('users').doc(userId).set({
        'uid': userId,
        'email': _userData.email,
        'name': _userData.name,
        'position': _userData.position,
        'keyArea': _userData.keyArea,
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      
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

  Future<String> uploadFile(XFile file, String userId, String fileType) async {
    try {
      final String fileName = '${userId}_${fileType}_${DateTime.now().millisecondsSinceEpoch}';
      final Reference storageRef = _storage.ref().child('user_files/$userId/$fileName');
      
      final UploadTask uploadTask = storageRef.putFile(file);
      final TaskSnapshot taskSnapshot = await uploadTask;
      
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading file: $e");
      rethrow;
    }
  }

  Future<void> uploadPhotoAndCV(XFile? photo, XFile? cv) async {
    try {
      String? photoUrl;
      String? cvUrl;

      if (photo != null) {
        photoUrl = await uploadFile(photo, _userData.userId!, 'photo');
      }

      if (cv != null) {
        cvUrl = await uploadFile(cv, _userData.userId!, 'cv');
      }

      _userData = _userData.copyWith(
        photoUrl: photoUrl ?? _userData.photoUrl,
        cvUrl: cvUrl ?? _userData.cvUrl
      );

      await saveUserData();
      notifyListeners();
    } catch (e) {
      print("Error uploading files: $e");
      rethrow;
    }
  }

  Future<void> uploadSignature(XFile signatureFile) async {
    try {
      if (_userData.userId == null) {
        throw Exception('User ID is required for uploading signature');
      }

      final String signatureUrl = await uploadFile(signatureFile, _userData.userId!, 'signature');
      
      _userData = _userData.copyWith(
        signatureUrl: signatureUrl
      );

      await saveUserData();
      notifyListeners();
    } catch (e) {
      print("Error uploading signature: $e");
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