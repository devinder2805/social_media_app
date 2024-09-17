import 'package:flutter/material.dart';
import 'package:pixa/widgets/help_pop_menu.dart';
import '../../model/country.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectCountryScreen extends StatelessWidget {
  static const routeName = "login/selectCountry";

  const SelectCountryScreen(this.deviceInfo, {super.key});
  final Map<String, String> deviceInfo;

  void getCountryCode(BuildContext bctx, String countryName) {
    for (int i = 0; i < countries.length; i++) {
      if (countries[i]["countryName"] == countryName) {
        deviceInfo["countryName"] = countryName;
        deviceInfo["countryCode"] = countries[i]["countryCode"].toString();
        Navigator.pop(bctx);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Choose a country",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          helpPopMenuButton(context)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: countries.map((country) {
            return ListTile(
              leading: SvgPicture.network(
                country["flagLink"],
                width: 25,
              ),
              title: Text(
                country["countryName"]!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                country["countryNameNative"]!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: Text(
                country["countryCode"].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                getCountryCode(context, country["countryName"]);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
