import 'package:app_clone_whatsapp/domain/entities/chat.dart';
import 'package:app_clone_whatsapp/views/pages/chat_individual_page.dart';
import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final Chat chatModel;
  const CardWidget({Key? key, required this.chatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChatIndividualPage(chatModel: chatModel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: blueGrey,
              child: SvgPicture.asset(
                  chatModel.isGroup ? 'assets/groups.svg' : 'assets/person.svg',
                  color: white,
                  height: 37,
                  width: 37),
            ),
            title: Text(chatModel.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3),
                Text(chatModel.currentMessage,
                    style: const TextStyle(fontSize: 13)),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(thickness: 1),
          )
        ],
      ),
    );
  }
}
