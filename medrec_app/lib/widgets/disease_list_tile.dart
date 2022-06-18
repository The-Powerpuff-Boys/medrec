import 'package:flutter/material.dart';

class DiseaseListTile extends StatelessWidget {
  final VoidCallback? onTap;
  const DiseaseListTile({Key? key, this.onTap}) : super(key: key);

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
        child: const ListTile(
          title: Text(
            'Disease Name',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            'View More',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
