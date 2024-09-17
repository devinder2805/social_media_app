import 'package:flutter/material.dart';
import 'package:pixa/screens/chat_screen.dart';
import 'package:pixa/screens/credenitials/login_screen.dart';
import 'package:pixa/screens/messages_screen.dart';
import 'package:pixa/tab_screen.dart';
import 'dart:ui' as ui;
import '../Theme/theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'model/languages.dart';
import 'screens/credenitials/select_country_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'model/country.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String langDefaultCode =
      ui.PlatformDispatcher.instance.locale.toString().toLowerCase();

  String getLanguageName() {
    for (int i = 0; i < languages.length; i++) {
      if (languages[i]["langCode"] == langDefaultCode.toLowerCase()) {
        return languages[i]["langNativeName"] as String;
      }
    }
    return "Select Language";
  }

  String selectedLangName = getLanguageName();

  Map<String, String> deviceInfo = {
    "langDefaultCode": langDefaultCode,
    "selectedLangCode": langDefaultCode,
    "selectedLangName": selectedLangName,
    "countryName": "",
    "countryCode": "",
    "phoneNumber": "",
  };

  // intiailise Position object
  Position position = Position(
    latitude: 0,
    longitude: 0,
    timestamp: DateTime.now(),
    altitude: 0.0,
    accuracy: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    altitudeAccuracy: 0.0,
    headingAccuracy: 0.0,
  );

  Future<void> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    position = await Geolocator.getCurrentPosition();
  }

  Future<List<String>> getCountryInfoFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        int i = countries.indexWhere(
          (country) => (country["countryName"] == place.country as String),
        );

        return [place.country as String, countries[i]["countryCode"] as String];
      } else {
        // return default country values
        return [
          countries[1]["countryName"],
          countries[1]["countryCode"].toString(),
        ];
      }
    } catch (e) {
      return [
        countries[1]["countryName"],
        countries[1]["countryCode"].toString(),
      ];
    }
  }

  Future<void> getCountryCodeAndName() async {
    await determinePosition();
    final List<String> countryInfo = await getCountryInfoFromLatLng(position);
    deviceInfo['countryName'] = countryInfo[0];
    deviceInfo['countryCode'] = countryInfo[1];
  }

  await getCountryCodeAndName();
  runApp(MyApp(deviceInfo));
}

class MyApp extends StatelessWidget {
  const MyApp(this.deviceInfo, {super.key});

  final Map<String, String> deviceInfo;
  final bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pixa",
      themeMode: ThemeMode.system,
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
      initialRoute: isLogin ? TabScreen.routeName : WelcomeScreen.routeName,
      routes: {
        TabScreen.routeName: (context) => TabScreen(deviceInfo),
        WelcomeScreen.routeName: (context) => WelcomeScreen(deviceInfo),
        LoginScreen.routeName: (context) => LoginScreen(deviceInfo),
        SelectCountryScreen.routeName: (context) =>
            SelectCountryScreen(deviceInfo),
        MessagesPage.routeName: (context) => MessagesPage(),
        ChatPage.routeName: (context) => ChatPage(),
      },
    );
  }
}
