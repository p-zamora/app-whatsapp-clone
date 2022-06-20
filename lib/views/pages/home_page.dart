import 'package:app_clone_whatsapp/views/pages/camera_page.dart';
import 'package:app_clone_whatsapp/views/pages/chat_page.dart';
import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('WhatsApp Clone'),
          actions: [
            const IconButton(
                icon: Icon(Icons.search, color: white), onPressed: null),
            PopupMenuButton(
              onSelected: (value) {

              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                      value: 'New Group', child: Text('New Group')),
                  const PopupMenuItem(
                      value: 'New broadcast', child: Text('New broadcast')),
                  const PopupMenuItem(
                      value: 'WhatsApp Web', child: Text('WhatsApp Web')),
                  const PopupMenuItem(
                      value: 'Starred messages',
                      child: Text('Starred messages')),
                  const PopupMenuItem(
                      value: 'Settings', child: Text('Settings'))
                ];
              },
            )
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: white,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              )
            ],
          )),
      body: TabBarView(
        controller: _controller,
        children: const [
          CameraPage(),
          ChatPage(),
          Text("Status"),
          Text("Calls")
        ],
      ),
    );
  }
}
