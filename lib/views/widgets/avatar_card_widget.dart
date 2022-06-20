import 'package:app_clone_whatsapp/domain/entities/chat.dart';
import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarCardWidget extends StatelessWidget {
  final Chat? contact;
  const AvatarCardWidget({Key? key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: blueGrey[200],
                child: SvgPicture.asset('assets/person.svg',
                    color: white, height: 30, width: 30),
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height:2),
          Text(contact!.name, style: const TextStyle(
            fontSize: 12
          ))
        ],
      ),
    );
  }
}
