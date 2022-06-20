import 'dart:io';

import 'package:app_clone_whatsapp/domain/entities/chat.dart';
import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatIndividualPage extends StatefulWidget {
  final Chat chatModel;
  const ChatIndividualPage({Key? key, required this.chatModel})
      : super(key: key);

  @override
  State<ChatIndividualPage> createState() => _ChatIndividualPageState();
}

class _ChatIndividualPageState extends State<ChatIndividualPage> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  FocusNode focusNode = FocusNode();

  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(''),
        Scaffold(
          backgroundColor: backgroundChat,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_back, size: 24),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: blueGrey,
                      child: SvgPicture.asset(
                          widget.chatModel.isGroup
                              ? 'assets/groups.svg'
                              : 'assets/person.svg',
                          color: white,
                          height: 25,
                          width: 25),
                    )
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.chatModel.name,
                          style: const TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                          )),
                      const Text('last seen today at 12:05',
                          style: TextStyle(fontSize: 13))
                    ],
                  ),
                ),
              ),
              actions: [
                const IconButton(
                    onPressed: null, icon: Icon(Icons.videocam, color: white)),
                const IconButton(
                    onPressed: null, icon: Icon(Icons.call, color: white)),
                PopupMenuButton(
                  onSelected: (value) {},
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                          value: 'View Contact', child: Text('View Contact')),
                      const PopupMenuItem(
                          value: 'Media, Links, and docs',
                          child: Text('Media, Links, and docs')),
                      const PopupMenuItem(
                          value: 'WhatsApp Web', child: Text('WhatsApp Web')),
                      const PopupMenuItem(value: 'Search', child: Text('Search')),
                      const PopupMenuItem(
                          value: 'Mute Notifications',
                          child: Text('Mute Notifications')),
                      const PopupMenuItem(
                          value: 'Wallpaper', child: Text('Wallpaper'))
                    ];
                  },
                )
              ],
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  ListView(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                    focusNode: focusNode,
                                    controller: _controller,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type a message',
                                        prefixIcon: IconButton(
                                            onPressed: () {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                              setState(() {
                                                emojiShowing = !emojiShowing;
                                              });
                                            },
                                            icon: const Icon(
                                                Icons.emoji_emotions_outlined,
                                                color: primaryColor)),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (builder) =>
                                                          bottomSheet());
                                                },
                                                icon: const Icon(Icons.attach_file,
                                                    color: primaryColor)),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.camera_alt,
                                                    color: primaryColor))
                                          ],
                                        ),
                                        contentPadding: const EdgeInsets.all(5)),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, right: 2, left: 2),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: secundaryColor,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.mic, color: white)),
                              ),
                            )
                          ],
                        ),
                        Offstage(
                            offstage: !emojiShowing,
                            child: SizedBox(height: 250, child: emojiSelect())),
                      ],
                    ),
                  )
                ],
              ),
              onWillPop: () {
                if (emojiShowing) {
                  setState(() {
                    emojiShowing = false;
                  });
                } else {
                  Navigator.of(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, indigo, "Document"),
                  const SizedBox(width: 40),
                  iconCreation(Icons.camera_alt, pink, "Camera"),
                  const SizedBox(width: 40),
                  iconCreation(Icons.insert_photo, purple, "Gallery"),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, orange, "Audio"),
                  const SizedBox(width: 40),
                  iconCreation(Icons.location_pin, teal, "Location"),
                  const SizedBox(width: 40),
                  iconCreation(Icons.person, blue, "Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon, size: 29, color: white),
          ),
          const SizedBox(height: 5),
          Text(text, style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      config: Config(
          columns: 7,
          emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: Category.RECENT,
          enableSkinTones: true,
          showRecentsTab: true,
          recentsLimit: 28,
          replaceEmojiOnLimitExceed: false,
          noRecents: const Text(
            'No Recents',
            style: TextStyle(fontSize: 20, color: black26),
            textAlign: TextAlign.center,
          ),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL),
      onBackspacePressed: _onBackspacePressed,
      onEmojiSelected: (category, emoji) {
        _onEmojiSelected(emoji);
      },
    );
  }
}
