import 'package:flutter/material.dart';
import 'chat_room_screen.dart'; // Menghubungkan ke halaman chat room

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list chat sesuai sketsa kertas pink Anda
    final List<Map<String, dynamic>> chatList = [
      {
        'name': 'Hary Nur Afandi',
        'lastMessage': 'oke saja',
        'time': '11:30',
        'unread': 1,
      },
      {
        'name': 'Budi Santoso',
        'lastMessage': 'oke siap!!',
        'time': '10:30',
        'unread': 0,
      },
      {
        'name': 'Andi Pratama',
        'lastMessage': 'Pesan telah dihapus',
        'time': 'Kemarin',
        'unread': 0,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.camera_alt_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.all(12.0), child: Text('Chats', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              Padding(padding: EdgeInsets.all(12.0), child: Text('Status', style: TextStyle(color: Colors.white70))),
              Padding(padding: EdgeInsets.all(12.0), child: Text('Calls', style: TextStyle(color: Colors.white70))),
            ],
          ),
        ),
      ),
      // Menggunakan ListView.separated sesuai materi bapak dosen halaman 5
      body: ListView.separated(
        itemCount: chatList.length,
        separatorBuilder: (context, index) => const Divider(indent: 72),
        itemBuilder: (context, index) {
          final chat = chatList[index];
          
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(chat['name'][0], style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
            ),
            title: Text(
              chat['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              chat['lastMessage'],
              style: TextStyle(
                color: chat['lastMessage'] == 'Pesan telah dihapus' ? Colors.grey : Colors.black87,
                fontStyle: chat['lastMessage'] == 'Pesan telah dihapus' ? FontStyle.italic : FontStyle.normal,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chat['time'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                if (chat['unread'] > 0)
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Text(
                      '${chat['unread']}',
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
              ],
            ),
            onTap: () {
              // Pindah ke halaman detail obrolan di folder pages
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRoomScreen(name: chat['name']),
                ),
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