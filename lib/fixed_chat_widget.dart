import 'package:flutter/material.dart';

class FixedChatWidget extends StatelessWidget {
  const FixedChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Fixed width for chat
      color: Colors.blueGrey[900],
      child: Column(
        children: [
          AppBar(
            title: const Text('실시간 채팅', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Expanded(
            child: Center(
              child: Text('채팅 내용 영역', style: TextStyle(color: Colors.white54)),
            ),
          ),
          // Input area placeholder
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '메시지 입력...',
                fillColor: Colors.white10,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}