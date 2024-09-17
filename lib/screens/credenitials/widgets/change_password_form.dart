import 'package:flutter/material.dart';
import 'package:pixa/screens/credenitials/login_screen.dart';
import 'package:pixa/screens/welcome/welcome_screen.dart';
import 'package:pixa/widgets/custom_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  late TextEditingController passwordController;
  late TextEditingController cPasswordController;

  @override
  void initState() {
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width < 600 ? double.infinity : 600;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CustomtextField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: passwordController,
              hintText: "Password",
              textAlign: TextAlign.left,
              keyBoardType: TextInputType.visiblePassword,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CustomtextField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: cPasswordController,
              hintText: "Confirm password",
              textAlign: TextAlign.left,
              keyBoardType: TextInputType.visiblePassword,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName,
                      (Route<dynamic> route) =>
                          route.settings.name == LoginScreen.routeName,
                    );
                  },
                  child: const Text("Login"))
            ],
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: width.toDouble(),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  // change password
                  LoginScreen.routeName,
                  (Route<dynamic> route) =>
                      route.settings.name == WelcomeScreen.routeName,
                );
              },
              child: const Text("Change Password"),
            ),
          ),
        ],
      ),
    );
  }
}
