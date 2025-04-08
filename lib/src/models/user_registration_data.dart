class UserRegistrationData {
  final String? userId;
  final String name;
  final String email;
  final String gender;
  final String position;
  final String keyArea;
  final String? lc;
  final String? dob;
  final String? phone;
  final String? emergencyPhone;
  final String? cin;
  final String? allergies;
  final String? illnesses;
  final String? singleroom;
  final String? photoUrl;  // URL for the uploaded photo in Firebase Storage
  final String? cvUrl;     // URL for the uploaded CV in Firebase Storage
  final String? signatureUrl; // URL for the uploaded signature in Firebase Storage
  final bool? registrationComplete;

  UserRegistrationData({
    this.userId,
    required this.name,
    required this.email,
    required this.gender,
    required this.position,
    required this.keyArea,
    this.lc,
    this.dob,
    this.phone,
    this.emergencyPhone,
    this.cin,
    this.allergies,
    this.illnesses,
    this.singleroom,
    this.photoUrl,
    this.cvUrl,
    this.signatureUrl,
    this.registrationComplete,
  });

  // Create a copy of the current instance with optional field updates
  UserRegistrationData copyWith({
    String? userId,
    String? name,
    String? email,
    String? gender,
    String? position,
    String? keyArea,
    String? lc,
    String? dob,
    String? phone,
    String? emergencyPhone,
    String? cin,
    String? allergies,
    String? illnesses,
    String? singleroom,
    String? photoUrl,
    String? cvUrl,
    String? signatureUrl,
    bool? registrationComplete,
  }) {
    return UserRegistrationData(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      position: position ?? this.position,
      keyArea: keyArea ?? this.keyArea,
      lc: lc ?? this.lc,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
      emergencyPhone: emergencyPhone ?? this.emergencyPhone,
      cin: cin ?? this.cin,
      allergies: allergies ?? this.allergies,
      illnesses: illnesses ?? this.illnesses,
      singleroom: singleroom ?? this.singleroom,
      photoUrl: photoUrl ?? this.photoUrl,
      cvUrl: cvUrl ?? this.cvUrl,
      signatureUrl: signatureUrl ?? this.signatureUrl,
      registrationComplete: registrationComplete ?? this.registrationComplete,
    );
  }

  // Convert UserRegistrationData instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'gender': gender,
      'position': position,
      'keyArea': keyArea,
      'lc': lc,
      'dob': dob,
      'phone': phone,
      'emergencyPhone': emergencyPhone,
      'cin': cin,
      'allergies': allergies,
      'illnesses': illnesses,
      'singleroom': singleroom,
      'photoUrl': photoUrl,
      'cvUrl': cvUrl,
      'signatureUrl': signatureUrl,
      'registrationComplete': registrationComplete,
    };
  }

  // Create a UserRegistrationData instance from a Map
  factory UserRegistrationData.fromJson(Map<String, dynamic> json) {
    return UserRegistrationData(
      userId: json['userId'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      position: json['position'] as String,
      keyArea: json['keyArea'] as String,
      lc: json['lc'] as String?,
      dob: json['dob'] as String?,
      phone: json['phone'] as String?,
      emergencyPhone: json['emergencyPhone'] as String?,
      cin: json['cin'] as String?,
      allergies: json['allergies'] as String?,
      illnesses: json['illnesses'] as String?,
      singleroom: json['singleroom'] as String?,
      photoUrl: json['photoUrl'] as String?,
      cvUrl: json['cvUrl'] as String?,
      registrationComplete: json['registrationComplete'] as bool?,
    );
  }
}