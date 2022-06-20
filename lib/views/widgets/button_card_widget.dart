import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:flutter/material.dart';

class ButtonCardWidget extends StatelessWidget {
  final String? name;
  final IconData? icon;
  const ButtonCardWidget({Key? key, this.name, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: secundaryColor,
          child: Icon(icon, size: 26, color: white),
        ),
        title: Text(name!,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      );
  }
}
