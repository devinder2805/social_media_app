import 'package:flutter/material.dart';
import 'package:pixa/screens/credenitials/login_screen.dart';
import 'package:pixa/screens/credenitials/verification_screen.dart';
import 'package:pixa/widgets/add_profile_image.dart';
import '../../../widgets/custom_field.dart';
import '../../../model/country.dart';
import '../select_country_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm(this.deviceInfo, {super.key});

  final Map<String, String> deviceInfo;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController nameController;
  late TextEditingController userNameController;
  late TextEditingController dobController;
  late TextEditingController genderController;
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController cPasswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    userNameController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController();
    countryNameController =
        TextEditingController(text: widget.deviceInfo["countryName"]);
    countryCodeController =
        TextEditingController(text: widget.deviceInfo["countryCode"]);
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryCodeController.dispose();
    countryNameController.dispose();
    phoneNumberController.dispose();
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AddProfileImage(),
                      Text(
                        "Add Profile\nImage",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      CustomtextField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: nameController,
                        hintText: "Enter name",
                        textAlign: TextAlign.left,
                        keyBoardType: TextInputType.name,
                      ),
                      const SizedBox(height: 20),
                      CustomtextField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: userNameController,
                        hintText: "Enter user name",
                        textAlign: TextAlign.left,
                        keyBoardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Flexible(
                  child: CustomtextField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: genderController,
                    hintText: "Gender",
                    textAlign: TextAlign.left,
                    keyBoardType: TextInputType.text,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: CustomtextField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: dobController,
                    hintText: "Date of birth",
                    textAlign: TextAlign.left,
                    keyBoardType: TextInputType.datetime,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
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
          Container(
            width: width.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CustomtextField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: emailController,
              hintText: "Enter email id",
              textAlign: TextAlign.left,
              keyBoardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 10),
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
                    Navigator.of(context).pushReplacementNamed(
                      LoginScreen.routeName,
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
                // validate
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const VerificationScreen(isLogin: false),
                  ),
                );
              },
              child: const Text("Sign Up"),
            ),
          ),
        ],
      ),
    );
  }
}
