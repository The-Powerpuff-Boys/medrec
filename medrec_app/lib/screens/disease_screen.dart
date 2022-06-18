import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/utils/themes.dart';

class DiseaseScreen extends ConsumerWidget {
  static const routename = '/disease';
  const DiseaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Disease',
          style: MedRecTheme.titleStyle,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: const [],
          )
        ],
      ),
    );
  }
}
