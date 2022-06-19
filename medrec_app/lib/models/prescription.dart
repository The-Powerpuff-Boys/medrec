class Prescription {
  final String doctorName;
  final String date;
  final String patientDescription;
  final String doctorDescription;
  final bool testReports;
  final List<String> medicines;
  Prescription({
    required this.doctorName,
    required this.date,
    required this.patientDescription,
    required this.doctorDescription,
    this.testReports = false,
    this.medicines = const [],
  });
}
