import 'package:flutter/material.dart';
import 'package:pixa/screens/credenitials/widgets/forgot_password_form.dart';
import 'package:pixa/widgets/help_pop_menu.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = "forgotPassword";

  const ForgotPasswordScreen(this.deviceInfo, {super.key});

  final Map<String, String> deviceInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Forgot Password",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [helpPopMenuButton(context)],
      ),
      body: ForgotPasswordForm(deviceInfo),
    );
  }
}
