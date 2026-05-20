import 'package:flutter/material.dart';
import 'chat_room_screen.dart';
import '../widgets/chat_item.dart'; // Sesuaikan folder 'widget'/'widgets'

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chatList = [
      {'name': 'Hary Nur Afandi', 'lastMessage': 'oke saja', 'time': '11:30', 'unread': 1},
      {'name': 'Budi Santoso', 'lastMessage': 'oke siap!!', 'time': '10:30', 'unread': 0},
      {'name': 'Andi Pratama', 'lastMessage': 'Pesan telah dihapus', 'time': 'Kemarin', 'unread': 0},
    ];

    // DefaultTabController wajib ada untuk membuat TabBar
    return DefaultTabController(
      length: 3, // Jumlah tab (Chats, Status, Calls)
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E54), // Warna khas WA
          title: const Text('WhatsApp', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Colors.white), onPressed: () {}),
            IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
          ],
          // Ini bagian TabBar yang hilang tadi:
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Isi Tab 1: Chats
            ListView.separated(
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
            // Isi Tab 2: Status
            const Center(child: Text("Halaman Status")),
            // Isi Tab 3: Calls
            const Center(child: Text("Halaman Calls")),
          ],
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
      ),
    );
  }
}