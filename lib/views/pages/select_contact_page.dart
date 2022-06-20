import 'package:app_clone_whatsapp/domain/entities/chat.dart';
import 'package:app_clone_whatsapp/views/pages/create_group_page.dart';
import 'package:app_clone_whatsapp/views/widgets/button_card_widget.dart';
import 'package:app_clone_whatsapp/views/widgets/contact_card_widget.dart';
import 'package:flutter/material.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({Key? key}) : super(key: key);

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  List<Chat> contacts = [
    Chat(name: 'Dev Stack', status: 'A full stack developer'),
    Chat(name: 'Balram', status: 'Flutter developer'),
    Chat(name: 'Saket', status: 'Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Selected contact',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              '25 contacts',
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search, size: 26)),
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: 'Invite a friend', child: Text('Invite a friend')),
                const PopupMenuItem(value: 'Contacts', child: Text('Contacts')),
                const PopupMenuItem(value: 'Refresh', child: Text('Refresh')),
                const PopupMenuItem(value: 'Help', child: Text('Help')),
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const CreateGroupPage()));
                },
                  child: const ButtonCardWidget(
                      icon: Icons.group, name: 'New Group'));
            } else if (index == 1) {
              return const ButtonCardWidget(
                  icon: Icons.person_add, name: 'New Contact');
            } else {
              return ContactCardWidget(chatModel: contacts[index - 2]);
            }
          }),
    );
  }
}
