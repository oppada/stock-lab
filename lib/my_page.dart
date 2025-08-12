import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('개인 프로필, 설정 등 마이 페이지 내용이 여기에 표시됩니다.', style: TextStyle(fontSize: 20)),
    );
  }
}