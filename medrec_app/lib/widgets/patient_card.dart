import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientCard extends ConsumerWidget {
  final VoidCallback? onTap;
  const PatientCard({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: InkWell(
        onTap: onTap ?? () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 104, 104, 104),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://images.unsplash.com/photo-1634409719592-7751d57c819d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                radius: 48,
              ),
              const SizedBox(width: 15),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                    AutoSizeText(
                      'Ms. Pooja',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AutoSizeText(
                      'Age: 25',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    AutoSizeText(
                      'Gender: Male',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
