import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/dummy_data/patient_data.dart';
import 'package:medrec_app/models/patient.dart';

final currPatientProvider = StateProvider<Patient?>((ref) {
  return;
});

final patientListsProvider = Provider<List<Patient>>((ref) {
  return patientData;
});
