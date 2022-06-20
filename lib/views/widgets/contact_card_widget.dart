import 'package:app_clone_whatsapp/domain/entities/chat.dart';
import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCardWidget extends StatelessWidget {
  final Chat chatModel;

  const ContactCardWidget({Key? key, required this.chatModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: blueGrey[200],
              child: SvgPicture.asset('assets/person.svg',
                  color: white, height: 30, width: 30),
            ),
            chatModel.select
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: teal,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: white,
                        size: 18,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
      title: Text(chatModel.name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      subtitle: Text(chatModel.status, style: const TextStyle(fontSize: 13)),
    );
  }
}
