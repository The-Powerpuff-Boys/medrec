import 'package:flutter/material.dart';
import 'package:medrec_app/models/diseases.dart';

class DiseaseListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Diseases disease;
  const DiseaseListTile({Key? key, this.onTap, required this.disease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 104, 104, 104),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(35),
            color: const Color.fromARGB(255, 64, 170, 232)),
        child: ListTile(
          title: Text(
            disease.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
