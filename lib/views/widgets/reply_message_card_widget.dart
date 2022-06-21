import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:flutter/material.dart';

class ReplyMessageCard extends StatelessWidget {
  const ReplyMessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: greenLigth,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 60, top: 5, bottom: 20),
                child: Text('Hey', style: TextStyle(fontSize: 16)),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text('20:58',
                    style: TextStyle(fontSize: 13, color: grey[600])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
