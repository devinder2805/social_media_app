import 'package:flutter/material.dart';

class AppLanguage extends StatelessWidget {
  const AppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: false,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "App Language",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        background: Container(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.close_outlined,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.tertiary,
          width: 1,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
