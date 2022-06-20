import 'dart:io';

import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewPage extends StatefulWidget {
  final String path;
  const VideoPreviewPage({Key? key, required this.path}) : super(key: key);

  @override
  State<VideoPreviewPage> createState() => _VideoPreviewPageState();
}

class _VideoPreviewPageState extends State<VideoPreviewPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    _controller.addListener(() { });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
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
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(                
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: black38,
                  child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: white,
                      size: 50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
