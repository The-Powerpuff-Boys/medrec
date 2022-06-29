import 'package:medrec_app/models/diseases.dart';

import '../utils/gender.dart';

class Patient {
  final String fullName; // fname
  final String age;
  final String? imgPath;
  final Gender? gender;
  final String imgUrl;
  final String abha;
  final List<Diseases> diseases;
  Patient({
    required this.fullName,
    required this.age,
    this.gender,
    required this.imgUrl,
    this.imgPath,
    required this.abha,
    this.diseases = const [],
  });
}
