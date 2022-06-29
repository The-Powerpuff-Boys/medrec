import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:medrec_app/models/prescription.dart';

class Diseases {
  final String name;
  final List<Prescription> prescriptions;
  Diseases({
    required this.name,
    required this.prescriptions,
  });

  Diseases copyWith({
    String? name,
    List<Prescription>? prescriptions,
  }) {
    return Diseases(
      name: name ?? this.name,
      prescriptions: prescriptions ?? this.prescriptions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'prescriptions': prescriptions.map((x) => x.toMap()).toList(),
    };
  }

  factory Diseases.fromMap(Map<String, dynamic> map) {
    return Diseases(
      name: map['name'] ?? '',
      prescriptions: List<Prescription>.from(map['prescriptions']?.map((x) => Prescription.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Diseases.fromJson(String source) => Diseases.fromMap(json.decode(source));

  @override
  String toString() => 'Diseases(name: $name, prescriptions: $prescriptions)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Diseases &&
      other.name == name &&
      listEquals(other.prescriptions, prescriptions);
  }

  @override
  int get hashCode => name.hashCode ^ prescriptions.hashCode;
}
