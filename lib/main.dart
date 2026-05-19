import 'package:flutter/material.dart';
import 'pages/chat_list_screen.dart'; // Import halaman utama dari folder pages

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          foregroundColor: Colors.white,
        ),
      ),
      // Langsung mengarah ke Halaman Utama di folder pages sesuai arsitektur dosen
      home: const ChatListScreen(),
    );
  }
}