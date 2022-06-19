import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/screens/add_disease_screen.dart';
import 'package:medrec_app/screens/disease_screen.dart';
import 'package:medrec_app/utils/themes.dart';
import 'package:medrec_app/widgets/disease_list_tile.dart';

import '../utils/gender.dart';
import '../widgets/patient_card.dart';

class PatientScreen extends ConsumerWidget {
  static const routename = '/patient';
  const PatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patient = ref.watch(patientProvider);
    final List<DiseaseListTile> tiles = patient!.diseases.map((disease) {
      return DiseaseListTile(
        disease: disease,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) =>
                  DiseaseScreen(prescriptions: disease.prescriptions))));
        },
      );
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          patient.fullName,
          style: MedRecTheme.titleStyle,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                      radius: 64,
                      backgroundImage:
                          CachedNetworkImageProvider(patient.imgUrl)),
                ),
                const SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  'Age: ${patient.age} | Gender: ${patient.gender == Gender.male ? 'Male' : 'Female'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                ...tiles,
                // DiseaseListTile(
                //   onTap: () {
                //     Navigator.of(context).pushNamed(DiseaseScreen.routename);
                //   },
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 60),
                  primary: const Color(0xff2AA4BC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddDiseaseScreen.routename);
                },
                child: const AutoSizeText(
                  'Add Record',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
