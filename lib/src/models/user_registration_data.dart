// model/user_registration_data.dart
class UserRegistrationData {
   String userId;
   String name;
   String email;
   String gender;
   String position;
   String keyArea;
   String? lc;
   String? dob;
   String? phone;
   String? emergencyPhone;
   String? cin;
   String? allergies;
   String? illnesses;
   String? singleroom;
   String? ocTeam;
   String? faciTeam;

  UserRegistrationData({
    required this.userId,
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
    this.ocTeam,
    this.faciTeam,
  });

  // Convert from JSON
  factory UserRegistrationData.fromJson(Map<String, dynamic> json) {
    return UserRegistrationData(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      position: json['position'],
      keyArea: json['keyArea'],
      lc: json['lc'],
      dob: json['dob'],
      phone: json['phone'],
      emergencyPhone: json['emergencyPhone'],
      cin: json['cin'],
      allergies: json['allergies'],
      illnesses: json['illnesses'],
      singleroom: json['singleroom'],
      ocTeam: json['ocTeam'],
      faciTeam: json['faciTeam'],
    );
  }

  // Convert to JSON
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
      'ocTeam': ocTeam,
      'faciTeam': faciTeam,
    };
  }

  // CopyWith method
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
    String? ocTeam,
    String? faciTeam,
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
      ocTeam: ocTeam ?? this.ocTeam,
      faciTeam: faciTeam ?? this.faciTeam,
    );
  }
}
