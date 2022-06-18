import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MedRecCard extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final bool transform;
  const MedRecCard({
    Key? key,
    required this.url,
    this.transform = true,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(color: const Color.fromARGB(255, 15, 26, 31)),
          ),
          child: Column(
            children: [
              Transform.rotate(
                  angle: transform ? pi / 2 : 0,
                  child: Image.asset(
                    url,
                    height: 100,
                  )),
              AutoSizeText(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              AutoSizeText(
                subtitle,
                style: const TextStyle(
                    color: Color(0xff636364),
                    fontWeight: FontWeight.w100,
                    fontSize: 6),
              )
            ],
          ),
        ),
      ),
    );
  }
}
