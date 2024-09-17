import 'package:flutter/material.dart';
import 'package:pixa/widgets/add_profile_image.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key});

  final List<Map<String, dynamic>> drawerListItems = [
    {
      "icon": Icon(Icons.settings),
      "title": "Settings",
    },
    {
      "icon": Icon(Icons.settings),
      "title": "Settings",
    },
    {
      "icon": Icon(Icons.settings),
      "title": "Settings",
    },
    {
      "icon": Icon(Icons.settings),
      "title": "Settings",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      width: 250,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.only(
              left: 20,
              top: 20 + MediaQuery.of(context).padding.top,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                AddProfileImage(),
                SizedBox(width: 10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "@johnDoe90",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...drawerListItems.map(
            (item) {
              return ListTile(
                leading: item["icon"] as Widget,
                title: Text(item["title"] as String),
                onTap: () {},
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
