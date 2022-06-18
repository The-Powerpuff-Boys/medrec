import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medrec_app/widgets/cards.dart';

class HomePage extends ConsumerWidget {
  static const routename = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        // TODO:

                        imageUrl:
                            'https://images.unsplash.com/photo-1644982647869-e1337f992828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      bottom: 5,
                      left: 5,
                      child: Text('Dr. Tarika',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.person),
              title: const Text('View Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.doorOpen),
              title: const Text('LogOut'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              'Hello Dr. Tarika',
              style: TextStyle(
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
              children: const [
                MedRecCard(
                  title: 'Search',
                  subtitle: 'Search for the patient medical records',
                  url: 'assets/icons/magnifier-glass.png',
                ),
                MedRecCard(
                  title: 'Add Record',
                  subtitle: 'Add a new patient record',
                  url: 'assets/icons/file.png',
                  transform: false,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
