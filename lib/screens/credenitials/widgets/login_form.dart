import 'package:flutter/material.dart';
import 'package:pixa/screens/credenitials/forgot_password_screen.dart';
import 'package:pixa/screens/credenitials/sign_up_screen.dart';
import '../../../widgets/custom_field.dart';
import '../select_country_screen.dart';
import '../../../model/country.dart';
import 'package:pixa/tab_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(this.deviceInfo, this.userInfo, {super.key});
  final Map<String, String> deviceInfo;
  final Map<String, String> userInfo;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    countryNameController =
        TextEditingController(text: widget.deviceInfo["countryName"]);
    countryCodeController =
        TextEditingController(text: widget.deviceInfo["countryCode"]);
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryCodeController.dispose();
    countryNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void getCountryName(String countryCode) {
    for (int i = 0; i < countries.length; i++) {
      if (countries[i]["countryCode"].toString() ==
          countryCodeController.text.toString()) {
        countryNameController.text = countries[i]["countryName"];

        widget.deviceInfo['countryName'] =
            countryNameController.text.toString();
        widget.deviceInfo['countryCode'] =
            countryCodeController.text.toString();
        return;
      }
    }

    countryNameController.text = "Invalid Country Code";
    widget.deviceInfo['countryName'] = countryNameController.text.toString();
    widget.deviceInfo['countryCode'] = countryCodeController.text.toString();
  }

  void validatePhone() {}

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
            child: Text(
              "Enter Phone nummber or user name or email id to login.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CustomtextField(
              onTap: () async {
                await Navigator.of(context)
                    .pushNamed(SelectCountryScreen.routeName);
                countryCodeController.text =
                    widget.deviceInfo["countryCode"].toString();
                countryNameController.text =
                    widget.deviceInfo["countryName"].toString();
              },
              style: Theme.of(context).textTheme.bodyMedium,
              controller: countryNameController,
              readOnly: true,
              suffixIcon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.primary,
                size: 22,
              ),
            ),
          ),
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomtextField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: countryCodeController,
                    keyBoardType: TextInputType.phone,
                    onChanged: (countryCode) {
                      getCountryName(countryCode);
                    },
                    prefixText: "+",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomtextField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: phoneNumberController,
                    keyBoardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    hintText: "Phone Number",
                    onChanged: (phoneNumber) {
                      widget.deviceInfo["phoneNumber"] = phoneNumber;
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text("OR"),
          ),
          const SizedBox(height: 10),
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CustomtextField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: emailController,
              readOnly: false,
              hintText: "Enter user name or email",
              textAlign: TextAlign.left,
              keyBoardType: TextInputType.text,
            ),
          ),
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              width: width.toDouble(),
              height: 1,
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            ),
          ),
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CustomtextField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: passwordController,
              readOnly: false,
              hintText: "Password",
              textAlign: TextAlign.left,
              keyBoardType: TextInputType.visiblePassword,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              child: const Text("Forgot password?"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordScreen(
                      widget.deviceInfo,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(
                        widget.deviceInfo,
                        widget.userInfo,
                      ),
                    ),
                  );
                },
                child: const Text("Sign up"),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: width.toDouble(),
            child: ElevatedButton(
              onPressed: () {
                // extract user info and validate data
                Navigator.of(context).pushNamedAndRemoveUntil(
                  TabScreen.routeName,
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
