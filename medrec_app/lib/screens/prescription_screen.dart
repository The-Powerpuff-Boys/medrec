import 'package:auto_size_text/auto_size_text.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medrec_app/models/prescription.dart';

import '../widgets/medrec_text_form.dart';

class PrescriptionScreen extends StatelessWidget {
  final Prescription prescription;
  const PrescriptionScreen({Key? key, required this.prescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrescriptionData(
                value: prescription.doctorName,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: DateTimeField(
                  initialValue: DateTime.parse(prescription.date),
                  decoration: InputDecoration(
                      labelText: 'Date',
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                        color: Color(0xff636364),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  format: DateFormat("yyyy-MM-dd"),
                  enabled: false,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              ),
              const Text('Patient Description'),
              PrescriptionData(
                value: prescription.patientDescription,
                maxLines: 4,
              ),
              const Text('Doctor Description'),
              PrescriptionData(
                value: prescription.doctorDescription,
                maxLines: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const AutoSizeText(
                      'Test Reports',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 6, 97, 153)),
                    ),
                    Switch(value: prescription.testReports, onChanged: (_) {}),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: [
                  for (var chips in prescription.medicines)
                    Chip(
                      label: Text(chips),
                    )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
