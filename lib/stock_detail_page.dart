import 'package:flutter/material.dart';

class StockDetailPage extends StatelessWidget {
  final String symbol;

  const StockDetailPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$symbol 상세 페이지'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$symbol 에 대한 상세 정보가 여기에 표시됩니다.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to previous screen
              },
              child: Text('뒤로 가기'),
            ),
          ],
        ),
      ),
    );
  }
}