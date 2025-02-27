import 'package:flutter/material.dart';
import 'package:pixa/screens/Home/widgets/post_widget.dart';
import 'package:pixa/screens/messages_screen.dart';
import 'package:pixa/screens/Home/widgets/story_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Base Architecture Of Flutter
      //Landing Page
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/pixa.png',
              height: 60,
            ),
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_box_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MessagesPage.routeName);
            },
            icon: const FaIcon(
              FontAwesomeIcons.paperPlane,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StoryWidget(),
            PostWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade700,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
