import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPatientRecordScreen extends ConsumerWidget {
  static const String routename = '/add_patient_record';
  const AddPatientRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      appBar: AppBar(),
    );
  }
}
