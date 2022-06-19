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
                    'https://images.pexels.com/photos/4546132/pexels-photo-4546132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
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
                      'Age: 15',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    AutoSizeText(
                      'Gender: Female',
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
