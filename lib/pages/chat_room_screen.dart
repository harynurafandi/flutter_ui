import 'package:flutter/material.dart';
import '../widgets/chat_buble.dart'; // Sesuaikan folder 'widget' atau 'widgets'

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
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54), // Warna khas WA
        title: Text(name, style: const TextStyle(color: Colors.white)),
        actions: [
          // Tambahkan tombol di sini:
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFE5DDD5), // Warna latar belakang chat WA
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(msg: messages[index]);
                },
              ),
            ),
            // Opsional: Tambahkan input pesan di bawah sini kalau mau
          ],
        ),
      ),
    );
  }
}