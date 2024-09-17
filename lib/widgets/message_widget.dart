import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {super.key,
      required this.image,
      required this.message,
      required this.pseudo});

  final String pseudo;
  final String image;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      title: Text(
        pseudo,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.camera_alt_outlined),
        onPressed: () {},
      ),
    );
  }
}
