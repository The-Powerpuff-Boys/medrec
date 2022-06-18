import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/utils/themes.dart';
import 'package:medrec_app/widgets/medrec_text_form.dart';

class AddDiseaseScreen extends ConsumerStatefulWidget {
  static const routename = '/add_disease';
  const AddDiseaseScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddDiseaseScreenState();
}

class _AddDiseaseScreenState extends ConsumerState<AddDiseaseScreen> {
  final TextEditingController _diseaseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Disease',
          style: MedRecTheme.titleStyle,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(children: [
              MedRecTextForm(
                  label: 'Disease Name', controller: _diseaseController)
            ]),
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
                  Navigator.of(context).pop();
                },
                child: const AutoSizeText(
                  'Submit',
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
