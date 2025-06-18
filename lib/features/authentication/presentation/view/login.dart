import 'package:flutter/material.dart';
import 'package:seclob/features/authentication/presentation/view/widgets/login_form.dart';
import 'package:seclob/features/authentication/presentation/view/widgets/login_header.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [LoginHeader(), Expanded(child: LoginForm())]),
    );
  }
}
