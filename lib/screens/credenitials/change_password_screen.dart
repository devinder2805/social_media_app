import 'package:flutter/material.dart';
import 'package:pixa/screens/credenitials/widgets/change_password_form.dart';
import 'package:pixa/widgets/help_pop_menu.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Change Password",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [helpPopMenuButton(context)],
      ),
      body: const ChangePasswordForm(),
    );
  }
}
