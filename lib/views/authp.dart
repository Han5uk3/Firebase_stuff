// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:untitled2/views/fbase.dart';
import 'package:untitled2/views/signp.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool is_login = true;

  @override
  Widget build(BuildContext context) =>
      is_login ?
      fbexample(onClickedSignUp: toggle) :
      spage(onClickedSignIn: toggle);

  void toggle() =>  setState(() => is_login = !is_login,);

}


