import 'package:flutter/material.dart';
import 'language_bottom_sheet.dart';
import '../../credenitials/login_screen.dart';

class PrivacyAndTerms extends StatefulWidget {
  const PrivacyAndTerms(this.deviceInfo, {super.key});
  final Map<String, String> deviceInfo;

  @override
  State<PrivacyAndTerms> createState() => _PrivacyAndTermsState();
}

class _PrivacyAndTermsState extends State<PrivacyAndTerms> {
  // selectLanguage
  void selectLanguage(String langCode, String langNativeName) {
    setState(() {
      widget.deviceInfo["selectedLangCode"] = langCode;
      widget.deviceInfo["selectedLangName"] = langNativeName;
    });
  }

  // show language bottom sheet
  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return DraggableLanguageSheet(widget.deviceInfo, selectLanguage);
      },
    );
  }

  // welcome message on start
  Widget welcomeMessage(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome to PIXA",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Read our ',
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: 'Privacy Policy.\n',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const TextSpan(text: 'Tap "Agree and Continue" to accept the '),
              TextSpan(
                text: 'Terms of Service.',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget languageButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < 600 ? double.infinity : 600,
      child: OutlinedButton(
        onPressed: () {
          _showLanguageSheet(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.language),
            Text(widget.deviceInfo["selectedLangName"] as String),
            const Icon(Icons.keyboard_arrow_down)
          ],
        ),
      ),
    );
  }

  Widget agreeButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < 600 ? double.infinity : 600,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            LoginScreen.routeName,
          );
        },
        style: Theme.of(context).elevatedButtonTheme.style,
        child: const Text("AGREE AND CONTINUE"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: double.infinity),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Image.asset(
            'assets/images/pixa.png',
            color: Theme.of(context).colorScheme.primary,
            width: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: welcomeMessage(context),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  languageButton(context),
                  const SizedBox(height: 20),
                  agreeButton(context),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
