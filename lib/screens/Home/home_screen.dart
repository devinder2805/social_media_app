import 'package:flutter/material.dart';
import 'package:pixa/screens/Home/widgets/drawer.dart';
import 'package:pixa/screens/Home/widgets/post_widget.dart';
import 'package:pixa/screens/messages_screen.dart';
import 'package:pixa/screens/Home/widgets/story_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const routeName = 'homePage';

  List<Widget> actionIcons(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add,
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
          Navigator.of(context).pushNamed(MessagesPage.routeName);
        },
        icon: const FaIcon(
          FontAwesomeIcons.paperPlane,
          size: 20,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Image.asset(
          'assets/images/pixa.png',
          height: 30,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        actions: actionIcons(context),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StoryWidget(),
            PostWidget(),
          ],
        ),
      ),
    );
  }
}
