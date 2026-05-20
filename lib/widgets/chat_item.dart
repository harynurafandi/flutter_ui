import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final Map<String, dynamic> chat;
  final VoidCallback onTap;

  const ChatItem({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(chat['name'][0], style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
      ),
      title: Text(chat['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
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
          Text(chat['time'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          if (chat['unread'] > 0)
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: Text('${chat['unread']}', style: const TextStyle(fontSize: 10, color: Colors.white)),
            )
        ],
      ),
      onTap: onTap,
    );
  }
}