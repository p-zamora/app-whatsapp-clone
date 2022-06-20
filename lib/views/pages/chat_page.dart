import 'package:app_clone_whatsapp/domain/entities/chat.dart';
import 'package:app_clone_whatsapp/views/pages/select_contact_page.dart';
import 'package:app_clone_whatsapp/views/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat> chats = [
    Chat(
        name: 'Dev Stack',
        isGroup: false,
        currentMessage: 'Hi Everyone',
        time: '4:00',
        icon: 'person.svg'),
    Chat(
      name: 'Kiskov',
      isGroup: false,
      currentMessage: 'Hi Kiskov',
      time: '10:00',
      icon: 'person.svg',
    ),
    Chat(
        name: 'Dev Server Chat',
        isGroup: true,
        currentMessage: 'Hi Everyone on this group',
        time: '10:00',
        icon: 'group.svg'),
    Chat(
        name: 'Collins',
        isGroup: false,
        currentMessage: 'Hi Dev Stack',
        time: '10:00',
        icon: 'person.svg'),
    Chat(
        name: 'Baltran Friends',
        isGroup: true,
        currentMessage: 'Hi Everyone',
        time: '10:00',
        icon: 'group.svg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => const SelectContactPage()));
        },
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CardWidget(chatModel: chats[index])),
    );
  }
}
