import 'package:flutter/material.dart';
import 'package:pixa/widgets/help_pop_menu.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "signUp";
  const SignUpScreen(this.deviceInfo, this.userInfo, {super.key});

  final Map<String, String> deviceInfo;
  final Map<String, String> userInfo;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Sign up to new PIXA account",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [helpPopMenuButton(context)],
      ),
      body: SignUpForm(widget.deviceInfo),
    );
  }
}
