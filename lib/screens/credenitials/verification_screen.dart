import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pixa/screens/credenitials/change_password_screen.dart';
import 'package:pixa/tab_screen.dart';
import 'package:pixa/widgets/help_pop_menu.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({required this.isLogin, super.key});
  final bool isLogin;
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController otpController;
  String otpCode = "";

  @override
  void initState() {
    otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width < 600 ? double.infinity : 600;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Verify OTP',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [helpPopMenuButton(context)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width.toDouble(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Enter the 4-digit OTP sent to your number',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: double.infinity, height: 10),
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: PinCodeTextField(
                cursorColor: Theme.of(context).colorScheme.primary,
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                controller: otpController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 45,
                  fieldWidth: 45,
                  inactiveColor: Theme.of(context).colorScheme.secondary,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  activeFillColor: Theme.of(context).colorScheme.secondary,
                  selectedFillColor: Theme.of(context).colorScheme.secondary,
                  inactiveFillColor: Theme.of(context).colorScheme.secondary,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (value) {
                  setState(() {
                    otpCode = value;
                  });
                },
                onCompleted: (value) {},
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: width.toDouble(),
              child: ElevatedButton(
                onPressed: () {
                  widget.isLogin
                      ? Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ChangePasswordScreen(),
                          ),
                        )
                      : Navigator.of(context).pushNamedAndRemoveUntil(
                          TabScreen.routeName,
                          (Route<dynamic> route) => false,
                        );
                },
                child: const Text("Verify OTP"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
