import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedRecTextForm extends StatelessWidget {
  final String label;
  final TextInputType type;
  final int? maxLines;
  final TextEditingController controller;
  final bool trailingIcon;
  final VoidCallback? onTap;
  const MedRecTextForm({
    Key? key,
    this.maxLines,
    required this.label,
    this.trailingIcon = false,
    this.onTap,
    required this.controller,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        autocorrect: true,
        controller: controller,
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
            suffixIcon: trailingIcon
                ? IconButton(
                    onPressed: onTap ?? () {},
                    icon: const FaIcon(FontAwesomeIcons.check))
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

class PrescriptionData extends StatelessWidget {
  final String value;
  final int? maxLines;
  const PrescriptionData({Key? key, required this.value, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        autocorrect: true,
        enableIMEPersonalizedLearning: true,
        enableSuggestions: true,
        enableInteractiveSelection: false,
        initialValue: value,
        maxLines: maxLines,
        decoration: InputDecoration(
            labelText: '',
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
