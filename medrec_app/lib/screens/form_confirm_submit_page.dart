import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:medrec_app/screens/login_page.dart';

class FormConfirmSubmitPage extends StatelessWidget {
  const FormConfirmSubmitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText('Thank you for Submitting your details',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff005EA7))),
              const SizedBox(height: 10),
              const AutoSizeText(
                'Our Team will verify your identity and your account will get activated within an hour. You will get an confirmation through your email and mobile.',
                softWrap: true,
                style: TextStyle(
                    color: Color(0xff050505), fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 40),
              const Text(
                '*You can close the app or go to login page to login once verified',
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                  color: Color.fromARGB(255, 98, 98, 98),
                  fontWeight: FontWeight.w200,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                          LoginPage.routename, (route) => false),
                  child: const Text('Login Page'))
            ],
          ),
        ),
      ),
    );
  }
}
