import 'package:medrec_app/models/diseases.dart';

import '../utils/gender.dart';

class Patient {
  final String fullName;
  final String age;
  final Gender? gender;
  final int abha;
  final Diseases? diseases;
  Patient({
    required this.fullName,
    required this.age,
    this.gender,
    required this.abha,
    this.diseases,
  });
}
