import 'package:flutter/material.dart';
import 'package:pixa/widgets/help_pop_menu.dart';
import 'widgets/privacy_and_terms.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "welcome";
  const WelcomeScreen(this.deviceInfo, {super.key});

  final Map<String, String> deviceInfo;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      actions: [helpPopMenuButton(context)],
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top,
          ),
          child: PrivacyAndTerms(deviceInfo),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
