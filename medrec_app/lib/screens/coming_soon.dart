import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  static const String routename = '/coming_soon';
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Oops!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText('This screen hasn\'t been implemented yet.',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2AA4BC))),
            Expanded(child: Image.asset('assets/coming_soon.png')),
          ],
        ),
      ),
    );
  }
}
