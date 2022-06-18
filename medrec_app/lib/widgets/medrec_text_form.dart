import 'package:flutter/material.dart';

class MedRecTextForm extends StatelessWidget {
  final String label;
  final TextInputType type;
  final int? maxLines;
  final TextEditingController controller;
  const MedRecTextForm({
    Key? key,
    this.maxLines,
    required this.label,
    required this.controller,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        autocorrect: true,
        enableIMEPersonalizedLearning: true,
        enableSuggestions: true,
        keyboardType: type,
        maxLines: maxLines,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: Color(0xff636364),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
