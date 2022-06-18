import 'dart:convert';

import 'package:medrec_app/utils/gender.dart';

class Doctor {
  final String fullName;
  final String email;
  final String imgUrl;
  final String specialization;
  final Gender? gender;
  final int phoneNumber;
  final bool verified;
  Doctor({
    required this.fullName,
    required this.email,
    required this.imgUrl,
    required this.specialization,
    this.gender,
    required this.phoneNumber,
    required this.verified,
  });

  Doctor copyWith({
    String? fullName,
    String? email,
    String? imgUrl,
    String? specialization,
    Gender? gender,
    int? phoneNumber,
    bool? verified,
  }) {
    return Doctor(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      imgUrl: imgUrl ?? this.imgUrl,
      specialization: specialization ?? this.specialization,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verified: verified ?? this.verified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'imgUrl': imgUrl,
      'specialization': specialization,
      'gender': gender.toString(),
      'phoneNumber': phoneNumber,
      'verified': verified,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      specialization: map['specialization'] ?? '',
      gender: map['gender'] == 'Male'
          ? Gender.male
          : map['gender'] == 'female'
              ? Gender.female
              : null,
      phoneNumber: map['p_no']?.toInt() ?? 0,
      verified: map['verified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Doctor(fullName: $fullName, email: $email, imgUrl: $imgUrl, specialization: $specialization, gender: $gender, phoneNumber: $phoneNumber, verified: $verified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Doctor &&
        other.fullName == fullName &&
        other.email == email &&
        other.imgUrl == imgUrl &&
        other.specialization == specialization &&
        other.gender == gender &&
        other.phoneNumber == phoneNumber &&
        other.verified == verified;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        email.hashCode ^
        imgUrl.hashCode ^
        specialization.hashCode ^
        gender.hashCode ^
        phoneNumber.hashCode ^
        verified.hashCode;
  }
}
