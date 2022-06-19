import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medrec_app/screens/add_patient_record_screen.dart';
import 'package:medrec_app/screens/coming_soon.dart';
import 'package:medrec_app/screens/login_page.dart';
import 'package:medrec_app/screens/search_screen.dart';
import 'package:medrec_app/widgets/cards.dart';

import '../providers/doctor_provider.dart';

class HomePage extends ConsumerWidget {
  static const routename = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctorData = ref.watch(doctorProvider);
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SizedBox(
                      child: CachedNetworkImage(
                        imageUrl: doctorData.imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Text(doctorData.fullName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.person),
              title: const Text('View Profile'),
              onTap: () {
                Navigator.of(context).pushNamed(ComingSoonScreen.routename);
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.doorOpen),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(LoginPage.routename);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Hello ${doctorData.fullName}',
              style: const TextStyle(
                  fontSize: 26,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0C6CB7)),
            ),
            const AutoSizeText(
              'How can we help you today',
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff848484)),
            ),
            GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 6.5 / 4,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              shrinkWrap: true,
              mainAxisSpacing: 24,
              children: [
                MedRecCard(
                  title: 'Search',
                  subtitle: 'Search for the patient medical records',
                  url: 'assets/icons/magnifier-glass.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(SearchScreen.routname);
                  },
                ),
                MedRecCard(
                  title: 'Add Record',
                  subtitle: 'Add a new patient record',
                  url: 'assets/icons/file.png',
                  transform: false,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AddPatientRecordScreen.routename);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
