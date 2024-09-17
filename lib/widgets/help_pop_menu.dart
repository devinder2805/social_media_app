import 'package:flutter/material.dart';

Widget helpPopMenuButton(BuildContext context) {
  return PopupMenuButton(
    itemBuilder: (BuildContext bctx) {
      return [
        PopupMenuItem(
          child: SizedBox(
            width: 150,
            child: Text(
              "Help",
              style: Theme.of(bctx).textTheme.bodyMedium,
            ),
          ),
          onTap: () {},
        ),
      ];
    },
    color: Theme.of(context).colorScheme.secondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.zero),
    ),
  );
}
