import '../utils/gender.dart';

class Patient {
  final String fullName;
  final String age;
  final Gender? gender;
  final int abha;
  Patient({
    required this.fullName,
    required this.age,
    this.gender,
    required this.abha,
  });
}
