import 'dart:io';

import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:flutter/material.dart';

class CameraPreviewPage extends StatelessWidget {
  final String path;
  const CameraPreviewPage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black12,
      appBar: AppBar(
        backgroundColor: black,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.crop_rotate, size: 27)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.emoji_emotions_outlined, size: 27)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.title, size: 27)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit, size: 27))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: black38,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  style: const TextStyle(color: white, fontSize: 17),
                  maxLines: 6,
                  minLines: 1,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add Caption...',
                      prefixIcon: Icon(Icons.add_photo_alternate,
                          color: white, size: 27),
                      hintStyle: TextStyle(color: white, fontSize: 17),
                      suffixIcon: CircleAvatar(
                        radius: 20,
                        backgroundColor: secundaryColor,
                        child: Icon(Icons.check, color: white, size: 27),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
