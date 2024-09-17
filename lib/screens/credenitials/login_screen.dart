import 'package:flutter/material.dart';
import 'package:pixa/widgets/help_pop_menu.dart';
import '../../widgets/show_dialogs.dart';
import '../../model/country.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login";
  const LoginScreen(this.deviceInfo, {super.key});

  final Map<String, String> deviceInfo;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Map<String, String> userInfo = {
    "name": "Devinder Kumar",
    "gender": "Male",
    "DOB": "12-sep-2003",
    "userName": "devinder123",
    "phoneNumber": "+918427307517",
    "email": "devinder.9878874376@gmail.com",
  };

  void sendCodeToPhone(BuildContext context) {
    final String phoneNumber = widget.deviceInfo["phoneNumber"]!;
    final String countryCode = widget.deviceInfo["countryCode"]!;
    final String countryName = widget.deviceInfo["countryName"]!;

    int idx = countries
        .indexWhere((country) => country["countryName"] == countryName);

    if (countryCode.isEmpty ||
        countryName.toLowerCase() == "invalid country code") {
      showAlertDialog(
        context: context,
        message: "Please enter valid country code first.",
      );
      return;
    }
    if (phoneNumber.isEmpty) {
      showAlertDialog(
        context: context,
        message: "Please enter your phone number first.",
      );
    } else if (phoneNumber.length < countries[idx]["minPhoneNumDigit"]) {
      showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too short for the country $countryName",
      );
    } else if (phoneNumber.length > countries[idx]["maxPhoneNumDigit"]) {
      showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too long for the country $countryName",
      );
    } else {
      showConfirmDialog(
        context: context,
        title: "+$countryCode $phoneNumber",
        message: "Is this the correct number?",
        confirmBtnText: "Yes",
        cancelBtnText: "Edit",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Login to PIXA",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [helpPopMenuButton(context)],
      ),
      body: LoginForm(widget.deviceInfo, userInfo),
    );
  }
}
