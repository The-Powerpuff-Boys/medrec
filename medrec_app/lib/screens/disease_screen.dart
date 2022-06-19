import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/screens/add_prescription_screen.dart';
import 'package:medrec_app/utils/themes.dart';

class DiseaseScreen extends ConsumerWidget {
  static const routename = '/disease';
  const DiseaseScreen({Key? key}) : super(key: key);

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
          Column(
            children: const [],
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
                  Navigator.of(context).pushNamed(PrescriptionScreen.routename);
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
