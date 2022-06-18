import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/gender.dart';
import '../widgets/medrec_text_form.dart';

final genderProvider = StateProvider.autoDispose<Gender>((ref) {
  return Gender.select;
});

class AddPatientRecordScreen extends ConsumerStatefulWidget {
  static const String routename = '/add_patient_record';

  const AddPatientRecordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPatientRecordScreenState();
}

class _AddPatientRecordScreenState
    extends ConsumerState<AddPatientRecordScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _abhaController = TextEditingController();

  final List<DropdownMenuItem<Gender>> _dropdownMenuItems = [
    const DropdownMenuItem(
      value: Gender.select,
      enabled: false,
      child: Text('Select Gender'),
    ),
    const DropdownMenuItem(
      value: Gender.male,
      child: Text('Male'),
    ),
    const DropdownMenuItem(
      value: Gender.female,
      child: Text('Female'),
    ),
    const DropdownMenuItem(
      value: Gender.nil,
      child: Text('Prefer Not to say'),
    ),
  ];

  final ImagePicker _imagePicker = ImagePicker();

  XFile? _image;

  void _pickProfileImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _abhaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Patient Record',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff0C6CB7)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: _pickProfileImage,
                      child: CircleAvatar(
                        radius: 64,
                        backgroundImage: _image == null
                            ? const AssetImage('assets/profile.png')
                                as ImageProvider<Object>
                            : FileImage(File(_image!.path)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MedRecTextForm(
                    label: 'Full Name',
                    controller: _nameController,
                  ),
                  MedRecTextForm(
                    label: 'Age',
                    controller: _abhaController,
                    type: TextInputType.number,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 140, 140, 140),
                          width: 1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: DropdownButton<Gender>(
                        value: ref.watch(genderProvider),
                        isExpanded: true,
                        items: _dropdownMenuItems,
                        onChanged: (gender) {
                          ref
                              .watch(genderProvider.state)
                              .update((state) => gender!);
                        }),
                  ),
                  MedRecTextForm(
                    label: 'Aadhar Card Number',
                    controller: _phoneController,
                    type: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xff02538A),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      textColor: Colors.white,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
