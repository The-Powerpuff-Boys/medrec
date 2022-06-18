import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medrec_app/screens/patient_screen.dart';
import 'package:medrec_app/utils/themes.dart';
import 'package:medrec_app/widgets/patient_card.dart';

final aadharNumberProvider = StateProvider<String>((ref) {
  return '';
});

class SearchScreen extends ConsumerWidget {
  static const String routname = '/search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search Patient',
            style: MedRecTheme.titleStyle,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff0C6CB7),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      enableIMEPersonalizedLearning: true,
                      maxLength: 12,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      expands: false,
                      decoration: const InputDecoration(
                        hintText: 'Enter Aadhaar Number',
                        prefixIcon: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 20,
                          color: Color(0xff0C6CB7),
                        ),
                        prefixIconConstraints:
                            BoxConstraints.tightFor(width: 25, height: 23),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w200,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        counterText: '',
                        border: InputBorder.none,
                        constraints: BoxConstraints.tightFor(
                            width: double.infinity, height: 44),
                      ),
                    ),
                  ),
                  PatientCard(
                    onTap: () {
                      Navigator.of(context).pushNamed(PatientScreen.routename);
                    },
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 60),
                    primary: const Color(0xff2AA4BC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  onPressed: () {},
                  child: const AutoSizeText(
                    'Search',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
