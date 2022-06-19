import 'package:medrec_app/models/diseases.dart';

import '../utils/gender.dart';

class Patient {
  final String fullName;
  final int age;
  final Gender? gender;
  final String imgUrl;
  final int abha;
  final Diseases? diseases;
  Patient({
    required this.fullName,
    required this.age,
    this.gender,
    required this.imgUrl,
    required this.abha,
    this.diseases,
  });
}
