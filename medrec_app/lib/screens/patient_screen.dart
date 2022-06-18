import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/widgets/disease_list_tile.dart';

class PatientScreen extends ConsumerWidget {
  static const routename = '/patient';
  const PatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ms. Pooja'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: CircleAvatar(
                      radius: 64,
                      backgroundImage: CachedNetworkImageProvider(
                          'https://images.unsplash.com/photo-1634409719592-7751d57c819d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80')),
                ),
                SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  'Age: 25 | Gender: Female',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30),
                DiseaseListTile(),
                DiseaseListTile(),
                DiseaseListTile(),
              ],
            ),
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
                onPressed: () {},
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
