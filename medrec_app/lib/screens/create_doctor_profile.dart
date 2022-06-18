import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/medrec_text_form.dart';

enum Gender {
  male,
  female,
  nil,
  select,
}

final genderProvider = StateProvider<Gender>((ref) {
  return Gender.select;
});

final fileProvider = StateProvider<PlatformFile?>((ref) {
  return;
});

class CreateDoctorProfileScreen extends ConsumerStatefulWidget {
  const CreateDoctorProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateDoctorProfileScreenState();
}

class _CreateDoctorProfileScreenState
    extends ConsumerState<CreateDoctorProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _specilizationController =
      TextEditingController();

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
  PlatformFile? _licenseFile;

  void _pickProfileImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      ref.watch(fileProvider.notifier).update((state) => result.files.single);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _specilizationController.dispose();

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 20.0),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AutoSizeText(
                      'Hello Doctor',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff005EA7),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AutoSizeText(
                      '''We need some details to prove that you are a doctor. After verification you gain access to our patients data ''',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w100,
                        color: Color(0xff636364),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                      label: 'Specilization',
                      controller: _specilizationController,
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
                      label: 'Phone Number',
                      controller: _phoneController,
                      type: TextInputType.phone,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: Text(
                    //     'Upload your Prescription',
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 0, 82, 134),
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: _pickFile,
                            child: const Text('Upload License')),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: AutoSizeText(
                            ref.watch(fileProvider) == null
                                ? 'No File chosen'
                                : ref.watch(fileProvider)!.name,
                            maxLines: 1,
                            wrapWords: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
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
      ),
    );
  }
}
