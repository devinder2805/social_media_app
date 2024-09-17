import 'package:flutter/material.dart';
import 'package:pixa/screens/Home/home_screen.dart';
import 'package:pixa/screens/ads_on/add_screen.dart';
import 'package:pixa/screens/profile/profile_screen.dart';
import 'package:pixa/screens/search/search_screen.dart';
import 'package:pixa/screens/welcome/welcome_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = "tabScreen";
  const TabScreen(this.deviceInfo, {super.key});

  final Map<String, String> deviceInfo;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  late List<Map<String, dynamic>> pages = [
    {
      "page": HomeScreen(),
      "title": "Home",
    },
    {
      "page": SocialMediaSearchPage(),
      "title": "Search",
    },
    {
      "page": const AddScreen(),
      "title": "Add",
    },
    {
      "page": WelcomeScreen(widget.deviceInfo),
      "title": "",
    },
    {
      // Passing required arguments to InstagramProfileScreen
      "page": ProfileScreen(
        userName: 'John Doe',
        bio: 'Flutter developer. Nature lover.',
        profileImageUrl: 'https://via.placeholder.com/150',
        posts: 120,
        followers: 1500,
        following: 300,
      ),
      "title": "Profile",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: pages[_selectedIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
