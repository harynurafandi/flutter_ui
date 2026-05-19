import 'package:flutter/material.dart';

class ChatRoomScreen extends StatelessWidget {
  final String name;
  const ChatRoomScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // Isi percakapan tiruan sesuai sketsa atas kertas pink Anda
    final List<Map<String, dynamic>> messages = [
      {'text': 'Halo, apa kabar', 'time': '10:20', 'isMe': false},
      {'text': 'Baik saja', 'time': '10:30', 'isMe': true},
      {'text': 'Mantap', 'time': '11:00', 'isMe': false},
      {'text': 'Oke saja', 'time': '11:30', 'isMe': true},
    ];

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[300],
              child: Text(name[0], style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 8),
            Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Container(
        color: const Color(0xFFECE5DD), // Latar belakang abu-abu WhatsApp lama
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final bool isMe = msg['isMe'];

                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isMe ? const Color(0xFFE1FFC7) : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
                          bottomRight: isMe ? Radius.zero : const Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: const Offset(0, 1)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(msg['text'], style: const TextStyle(fontSize: 16, color: Colors.black87)),
                          const SizedBox(height: 4),
                          // Row menyamping untuk Jam dan Status Centang (menyelesaikan kendala layout)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(msg['time'], style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              if (isMe) ...[
                                const SizedBox(width: 4),
                                const Icon(Icons.done_all, size: 14, color: Colors.blue),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          IconButton(icon: const Icon(Icons.sentiment_satisfied_alt, color: Colors.grey), onPressed: () {}),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ketik Pesan...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(icon: const Icon(Icons.camera_alt, color: Colors.grey), onPressed: () {}),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFF075E54),
                    child: IconButton(icon: const Icon(Icons.mic, color: Colors.white), onPressed: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}