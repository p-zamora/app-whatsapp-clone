import 'package:app_clone_whatsapp/domain/entities/chat.dart';
import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:app_clone_whatsapp/views/widgets/avatar_card_widget.dart';
import 'package:app_clone_whatsapp/views/widgets/contact_card_widget.dart';
import 'package:flutter/material.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  List<Chat> contacts = [
    Chat(name: 'Dev Stack', status: 'A full stack developer'),
    Chat(name: 'Balram', status: 'Flutter developer'),
    Chat(name: 'Saket', status: 'Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
    Chat(name: 'Dev', status: 'App Developer'),
  ];

  List<Chat> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'New Group',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              'Add participants',
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search, size: 26)),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: groups.isNotEmpty ? const EdgeInsets.only(top: 82) : const EdgeInsets.only(top: 0),
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (contacts[index].select == false) {
                          setState(() {
                            contacts[index].select = true;
                            groups.add(contacts[index]);
                          });
                        } else {
                          setState(() {
                            contacts[index].select = false;
                            groups.remove(contacts[index]);
                          });
                        }
                      },
                      child: ContactCardWidget(chatModel: contacts[index]));
                }),
          ),
          groups.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: white,
                      child: ListView.builder(
                        itemCount: contacts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    groups.remove(contacts[index]);
                                    contacts[index].select = false;
                                  });
                                },
                                child:
                                    AvatarCardWidget(contact: contacts[index]));
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),                    
                    const Divider(thickness: 1)
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
