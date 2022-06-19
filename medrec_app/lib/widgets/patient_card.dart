import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/models/patient.dart';

import '../utils/gender.dart';

final patientProvider = StateProvider<Patient?>((ref) {
  return;
});

class PatientCard extends ConsumerWidget {
  final VoidCallback? onTap;
  final Patient patient;
  const PatientCard({Key? key, this.onTap, required this.patient})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(patientProvider.notifier).update((state) => patient);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: InkWell(
        onTap: onTap ?? () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 104, 104, 104),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(patient.imgUrl),
                radius: 48,
              ),
              const SizedBox(width: 15),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    AutoSizeText(
                      patient.fullName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AutoSizeText(
                      'Age: ${patient.age}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    AutoSizeText(
                      'Gender: ${patient.gender == Gender.female ? 'Female' : 'Male'}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
