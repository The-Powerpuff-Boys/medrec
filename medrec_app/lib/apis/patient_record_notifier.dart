import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/diseases.dart';
import '../models/patient.dart';
import '../models/prescription.dart';
import '../utils/gender.dart';

final patientsListProvider =
    StateNotifierProvider<PatientNotifier, List<Patient>>((ref) {
  return PatientNotifier();
});

class PatientNotifier extends StateNotifier<List<Patient>> {
  PatientNotifier()
      : super([
          // Patient(
          //   fullName: 'Ms. Pooja',
          //   age: '15',
          //   abha: '102424484562',
          //   imgUrl:
          //       'https://images.pexels.com/photos/4546132/pexels-photo-4546132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          //   gender: Gender.female,
          //   diseases: [
          //     Diseases(
          //       name: 'Jaundice',
          //       prescriptions: [
          //         Prescription(
          //           doctorName: 'Dr. Rohit',
          //           doctorDescription:
          //               'Et magna gubergren ut sanctus elitr stet. Duo ipsum sea et ipsum. Sit labore et dolores aliquyam rebum kasd invidunt.',
          //           date: '2020-01-01',
          //           patientDescription:
          //               'Et magna gubergren ut sanctus elitr stet. Duo ipsum sea et ipsum. Sit labore et dolores aliquyam rebum kasd invidunt.',
          //         )
          //       ],
          //     ),
          //   ],
          // ),
        ]);

  void addPatient(Patient patient) {
    state = [...state, patient];
  }

  void searchPatient(String abha) {
    final result = Patient(
      fullName: 'Ms. Pooja',
      age: '15',
      abha: '102424484562',
      imgUrl:
          'https://images.pexels.com/photos/4546132/pexels-photo-4546132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      gender: Gender.female,
      diseases: [
        Diseases(
          name: 'Jaundice',
          prescriptions: [
            Prescription(
              doctorName: 'Dr. Rohit',
              doctorDescription:
                  'Et magna gubergren ut sanctus elitr stet. Duo ipsum sea et ipsum. Sit labore et dolores aliquyam rebum kasd invidunt.',
              date: '2020-01-01',
              patientDescription:
                  'Et magna gubergren ut sanctus elitr stet. Duo ipsum sea et ipsum. Sit labore et dolores aliquyam rebum kasd invidunt.',
            )
          ],
        ),
      ],
    );
    // final result = state.where((patient) {
    //   return patient.abha == abha;
    // }).toList();
    state = [result];
  }

  void addDisease(Diseases disease) {}

  void addPrescription(Prescription prescription) {}
}
