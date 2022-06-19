import 'package:medrec_app/models/prescription.dart';

class Diseases {
  final String name;
  final List<Prescription> prescriptions;
  Diseases({
    required this.name,
    required this.prescriptions,
  });
}
