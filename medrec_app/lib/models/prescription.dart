import 'dart:convert';

class Prescription {
  final String? diseaseId; //params mein bhejna
  final String? docId;
  final String doctorName; //docname
  final String date;
  final String patientDescription;
  final String doctorDescription;
  final bool testReports;
  final List<String> medicines;
  Prescription({
    this.diseaseId,
    this.docId,
    required this.doctorName,
    required this.date,
    required this.patientDescription,
    required this.doctorDescription,
    this.testReports = false,
    this.medicines = const [],
  });

  Prescription copyWith({
    String? diseaseId,
    String? doctorName,
    String? date,
    String? patientDescription,
    String? doctorDescription,
    bool? testReports,
    List<String>? medicines,
  }) {
    return Prescription(
      diseaseId: diseaseId ?? this.diseaseId,
      doctorName: doctorName ?? this.doctorName,
      date: date ?? this.date,
      patientDescription: patientDescription ?? this.patientDescription,
      doctorDescription: doctorDescription ?? this.doctorDescription,
      testReports: testReports ?? this.testReports,
      medicines: medicines ?? this.medicines,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'diseaseId': diseaseId,
      'doctorName': doctorName,
      'date': date,
      'patientDescription': patientDescription,
      'doctorDescription': doctorDescription,
      'testReports': testReports,
      'medicines': medicines,
    };
  }

  factory Prescription.fromMap(Map<String, dynamic> map) {
    return Prescription(
      diseaseId: map['diseaseId'],
      doctorName: map['doctorName'] ?? '',
      date: map['date'] ?? '',
      patientDescription: map['patientDescription'] ?? '',
      doctorDescription: map['doctorDescription'] ?? '',
      testReports: map['testReports'] ?? false,
      medicines: List<String>.from(map['medicines']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Prescription.fromJson(String source) =>
      Prescription.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Prescription(diseaseId: $diseaseId, doctorName: $doctorName, date: $date, patientDescription: $patientDescription, doctorDescription: $doctorDescription, testReports: $testReports, medicines: $medicines)';
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //   final listEquals = const DeepCollectionEquality().equals;

  //   return other is Prescription &&
  //       other.diseaseId == diseaseId &&
  //       other.doctorName == doctorName &&
  //       other.date == date &&
  //       other.patientDescription == patientDescription &&
  //       other.doctorDescription == doctorDescription &&
  //       other.testReports == testReports &&
  //       listEquals(other.medicines, medicines);
  // }
}
