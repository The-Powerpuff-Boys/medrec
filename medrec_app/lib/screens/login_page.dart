import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/screens/create_doctor_profile.dart';
import 'package:medrec_app/screens/home_page.dart';

import '../providers/auth_provider.dart';

enum Status {
  login,
  signUp,
}

Status type = Status.login;

class LoginPage extends StatefulWidget {
  static const routename = '/LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //  GlobalKey is used to validate the Form
  final GlobalKey<FormState> _formKey = GlobalKey();

  //  TextEditingController to get the data from the TextFields
  //  we can also use Riverpod to manage the state of the TextFields
  //  but again I am not using it here
  final _email = TextEditingController();
  final _password = TextEditingController();

  //  A loading variable to show the loading animation when you a function is ongoing
  bool _isLoading = false;
  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _switchType() {
    if (type == Status.signUp) {
      setState(() {
        type = Status.login;
      });
    } else {
      setState(() {
        type = Status.signUp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer(builder: (context, ref, _) {
          final auth = ref.watch(authProvider);

          Future<void> _onPressedFunction() async {
            if (!_formKey.currentState!.validate()) {
              return;
            }

            if (type == Status.login) {
              try {
                loading();
                
                // await auth.login(_email.text, _password.text);
                if (!mounted) return;
                Navigator.pushReplacementNamed(context, HomePage.routename);
              } on Exception {
                rethrow;
              }
            } else {
              loading();
              // await auth.signUp(_email.text, _password.text);
              if (!mounted) return;
              Navigator.pushReplacementNamed(
                  context, CreateDoctorProfileScreen.routename);
            }
          }

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: SizedBox(
                                width: 250,
                                height: 250,
                                child: Image.asset('assets/logo.png'))),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            controller: _email,
                            autocorrect: true,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {},
                            decoration: InputDecoration(
                              hintText: 'Email address',
                              hintStyle: const TextStyle(color: Colors.black54),
                              icon: Icon(Icons.email_outlined,
                                  color: Colors.blue.shade700, size: 24),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            controller: _password,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.black54),
                              icon: Icon(CupertinoIcons.lock_circle,
                                  color: Colors.blue.shade700, size: 24),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        if (type == Status.signUp)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Confirm password',
                                hintStyle:
                                    const TextStyle(color: Colors.black54),
                                icon: Icon(CupertinoIcons.lock_circle,
                                    color: Colors.blue.shade700, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                              validator: type == Status.signUp
                                  ? (value) {
                                      if (value != _password.text) {
                                        return 'Passwords do not match!';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 32.0),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            child: _isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : MaterialButton(
                                    onPressed: _onPressedFunction,
                                    textColor: Colors.blue.shade700,
                                    textTheme: ButtonTextTheme.primary,
                                    minWidth: 100,
                                    padding: const EdgeInsets.all(18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: Colors.blue.shade700),
                                    ),
                                    child: Text(
                                      type == Status.login
                                          ? 'Log in'
                                          : 'Sign up',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: RichText(
                              text: TextSpan(
                                text: type == Status.login
                                    ? 'Don\'t have an account? '
                                    : 'Already have an account? ',
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: type == Status.login
                                          ? 'Sign up now'
                                          : 'Log in',
                                      style: TextStyle(
                                          color: Colors.blue.shade700),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _switchType();
                                        })
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
