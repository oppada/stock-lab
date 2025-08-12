import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column( // Use Column as the main container for the page content
      children: [
        // TabBar for different community boards
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '자유 게시판'),
            Tab(text: '종목 토론'),
            Tab(text: '투자 일지'),
          ],
          labelColor: Theme.of(context).colorScheme.primary, // Selected tab color
          unselectedLabelColor: Colors.grey, // Unselected tab color
          indicatorColor: Theme.of(context).colorScheme.primary, // Indicator color
        ),
        // TabBarView to display content for each tab
        Expanded( // Use Expanded to fill remaining space
          child: TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text('자유 게시판 내용', style: TextStyle(fontSize: 20))),
              Center(child: Text('종목 토론 내용', style: TextStyle(fontSize: 20))),
              Center(child: Text('투자 일지 공유 내용', style: TextStyle(fontSize: 20))),
            ],
          ),
        ),
      ],
    );
  }
}