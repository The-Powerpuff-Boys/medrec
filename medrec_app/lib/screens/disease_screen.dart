import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/models/prescription.dart';
import 'package:medrec_app/screens/add_prescription_screen.dart';
import 'package:medrec_app/screens/prescription_screen.dart';
import 'package:medrec_app/utils/themes.dart';
import 'package:medrec_app/widgets/prescription_list_tile.dart';

class DiseaseScreen extends ConsumerWidget {
  static const routename = '/disease';
  final List<Prescription> prescriptions;
  const DiseaseScreen({Key? key, required this.prescriptions})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Disease',
          style: MedRecTheme.titleStyle,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
            itemCount: prescriptions.length,
            itemBuilder: (BuildContext context, int index) {
              return PrescriptionListTile(
                prescription: prescriptions[index],
                index: index + 1,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => PrescriptionScreen(
                          prescription: prescriptions[index]))));
                },
              );
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 60),
                  primary: const Color(0xff2AA4BC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AddPrescriptionScreen.routename);
                },
                child: const AutoSizeText(
                  'Add Prescription',
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
