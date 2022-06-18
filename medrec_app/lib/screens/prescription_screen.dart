import 'package:auto_size_text/auto_size_text.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medrec_app/utils/themes.dart';
import 'package:medrec_app/widgets/medrec_text_form.dart';

final testReportsProvider = StateProvider<bool>((ref) {
  return false;
});

class PrescriptionScreen extends ConsumerStatefulWidget {
  static const routename = '/prescription';
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PrescriptionScreenState();
}

class _PrescriptionScreenState extends ConsumerState<PrescriptionScreen> {
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _patientController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Prescription',
            style: MedRecTheme.titleStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MedRecTextForm(
                    label: 'Doctor Name', controller: _doctorController),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DateTimeField(
                    controller: _dateController,
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
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                ),
                MedRecTextForm(
                  label: 'Patient Description',
                  controller: _patientController,
                  maxLines: 4,
                ),
                MedRecTextForm(
                  label: 'Doctor Description',
                  controller: _doctorController,
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
                      Switch(
                          value: ref.watch(testReportsProvider),
                          onChanged: (value) {
                            ref
                                .read(testReportsProvider.notifier)
                                .update((state) => value);
                          }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 60),
                      primary: const Color(0xff2AA4BC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                    onPressed: () {},
                    child: const AutoSizeText(
                      'Add Prescription',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Date
// Doctor name
// Testreport - bool
// Patient  Descritption
// Doctor Descritption
// Medicine [ array]
