// ignore_for_file: camel_case_types, annotate_overrides

import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/views/signp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class fbexample extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const fbexample({super.key, required this.onClickedSignUp});

  @override
  State<fbexample> createState() => _fbexampleState();
}

final GlobalKey<FormState> ky = GlobalKey<FormState>();
TextEditingController nm = TextEditingController();
TextEditingController ps = TextEditingController();

class _fbexampleState extends State<fbexample> {
  @override
  Future login(em, ps) async {
    final isValid = ky.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: em, password: ps);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: ky,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      controller: nm,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value != null && !EmailValidator.validate(value)
                              ? "Enter a valid email"
                              : null,
                      decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white)),
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: ps,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || (value.length < 8)
                          ? "Minimum password length is 8"
                          : null,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white)),
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: ElevatedButton(
                        style: ButtonStyle(shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    10))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {
                          login(nm.text.trim(), ps.text.trim());
                        },
                        child: const Text("Login",style: TextStyle(fontSize: 18,color: Colors.black),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(color: Colors.white,fontSize: 16,),
                            text: "No account? ",
                            children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUp,
                            text: "Sign Up",
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,fontSize: 16,),
                          )
                        ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
