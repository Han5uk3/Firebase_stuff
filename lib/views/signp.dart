// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class spage extends StatefulWidget {
  final Function() onClickedSignIn;
  const spage({super.key, required this.onClickedSignIn});

  @override
  State<spage> createState() => _spageState();
}

final GlobalKey<FormState> kc = GlobalKey();
TextEditingController nm = TextEditingController();
TextEditingController ps = TextEditingController();
TextEditingController psa = TextEditingController();
TextEditingController agc = TextEditingController();
TextEditingController nmc = TextEditingController();

class _spageState extends State<spage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: kc,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "SIGNUP",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.next,
                      controller: nmc,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value == null ? "Name required" : null,
                      decoration: const InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Eg. John Doe",
                          hintStyle: TextStyle(color: Colors.grey),
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
                      style: const TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.next,
                      controller: agc,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value == null ? "Age required" : null,
                      decoration: const InputDecoration(
                          labelText: "Age",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Enter your age",
                          hintStyle: TextStyle(color: Colors.grey),
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
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: nm,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value != null && !EmailValidator.validate(value)
                              ? "Enter a valid email"
                              : null,
                      decoration: const InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
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
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      controller: ps,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || (value.length < 8)
                          ? "Minimum password length is 8"
                          : null,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.grey),
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
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      controller: psa,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value != ps.text
                          ? "Passwords do not match"
                          : null,
                      decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white)),
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {
                          signup(nmc.text.trim(), agc.text.toString().trim(),
                              nm.text.trim(), psa.text.trim(), context);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            text: "Already Have An account? ",
                            children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignIn,
                            text: "Log In",
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.purple),
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

  Future signup(name, age, email, pass, BuildContext context) async {
    final isValid = kc.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      var ins = FirebaseAuth.instance;
      var refer = await ins.createUserWithEmailAndPassword(
          email: email, password: pass);
      var userId = refer.user!.uid;
      await saveDetails(name, nm.text.trim(), age, userId);
    } on FirebaseAuthException catch (e) {
      utils.showSnackBar(e.message);
    }
  }

  Future saveDetails(name, email, age, usid) async {
    try {
      var instance = FirebaseFirestore.instance;
      var data = {
        "Name": name,
        "Email": email,
        "Age": age,
      };
      await instance.collection("Users").doc(usid).set(data);
    } catch (e) {
      stdout.write("Error $e");
    }
  }
}
