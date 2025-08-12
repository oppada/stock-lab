import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('채팅 화면 내용이 여기에 표시됩니다.', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}