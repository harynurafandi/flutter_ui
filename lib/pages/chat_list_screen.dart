import 'package:flutter/material.dart';
import 'chat_room_screen.dart';
import '../widgets/chat_item.dart'; // Pastikan nama foldernya 'widget' atau 'widgets' sesuai milikmu

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list chat (jangan pakai ...)
    final List<Map<String, dynamic>> chatList = [
      {'name': 'Hary Nur Afandi', 'lastMessage': 'oke saja', 'time': '11:30', 'unread': 1},
      {'name': 'Budi Santoso', 'lastMessage': 'oke siap!!', 'time': '10:30', 'unread': 0},
      {'name': 'Andi Pratama', 'lastMessage': 'Pesan telah dihapus', 'time': 'Kemarin', 'unread': 0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.camera_alt_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView.separated(
        itemCount: chatList.length,
        separatorBuilder: (context, index) => const Divider(indent: 72),
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ChatItem(
            chat: chat,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatRoomScreen(name: chat['name'])),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF075E54),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: 'Komunitas'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Me'),
        ],
      ),
    );
  }
}