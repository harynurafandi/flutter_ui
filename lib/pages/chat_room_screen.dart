import 'package:flutter/material.dart';
import '../widgets/chat_buble.dart'; // Pastikan nama filenya sesuai dengan yang ada di folder 'widget'

class ChatRoomScreen extends StatelessWidget {
  final String name;
  const ChatRoomScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {'text': 'Halo, apa kabar', 'time': '10:20', 'isMe': false},
      {'text': 'Baik saja', 'time': '10:30', 'isMe': true},
      {'text': 'Mantap', 'time': '11:00', 'isMe': false},
      {'text': 'Oke saja', 'time': '11:30', 'isMe': true},
    ];

    return Scaffold(
      appBar: AppBar(title: Text(name)), // AppBar sederhana dulu agar fokus ke isi
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // Memanggil widget ChatBubble yang sudah dibuat
                return ChatBubble(msg: messages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}