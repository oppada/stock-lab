import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart'; // kIsWeb을 위해 추가
import 'stock_detail_page.dart'; // StockDetailPage를 위해 추가
import 'auth_page.dart'; // AuthPage를 위해 추가
import 'community_page.dart'; // New import
import 'investment_tools_page.dart'; // New import
import 'my_page.dart'; // New import
import 'fixed_chat_widget.dart'; // FixedChatWidget을 위해 추가
import 'chat_page.dart'; // ChatPage를 위해 추가

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://htijazrxzwsmmeoihurt.supabase.co', // 여기에 Supabase URL을 붙여넣으세요
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh0aWphenJ4endzbW1lb2lodXJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ5NjQ3NDEsImV4cCI6MjA3MDU0MDc0MX0.msXrkPUoNmAro8vJYcXxZ7kyrb5bogVzl7n-A424r4I', // 여기에 Supabase anon key를 붙여넣으세요
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock-Lab',
      theme: ThemeData(
        // Light theme (default, can be expanded later)
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212), // Main background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212), // App bar background
          foregroundColor: Colors.white, // App bar text color
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFE0E0E0)), // Basic text
          displayLarge: TextStyle(color: Colors.white), // Emphasized text
          // Define other text styles as needed
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00C853), // Light Green (Accent for primary)
          secondary: Color(0xFFFFD600), // Yellow (Accent for secondary)
          error: Color(0xFFFF5252), // Red (Error/down)
          background: Color(0xFF121212), // Background
          surface: Color(0xFF121212), // Card/surface background
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onError: Colors.white,
          onBackground: Color(0xFFE0E0E0),
          onSurface: Color(0xFFE0E0E0),
        ),
      ),
      themeMode: ThemeMode.dark, // Set theme mode to dark
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      home: const MyHomePage(), // 여기에 실제 홈 페이지 위젯을 연결합니다.
    );
  }
}

class MyHomePage extends StatefulWidget { // Changed to StatefulWidget
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // State for selected tab

  static final List<Widget> _pages = <Widget>[
    const _HomePageContent(), // Original MyHomePage content
    const CommunityPage(),
    const InvestmentToolsPage(),
    const MyPage(),
    const ChatPage(), // New: Chat Page
  ];

  // New: Control chat visibility per page
  static const List<bool> _showChatOnPage = <bool>[
    true, // Home Page
    true, // Community Page
    true, // Investment Tools Page
    false, // My Page (Chat hidden)
    false, // Chat Page (Fixed chat hidden, as it's the chat page itself)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('스탁랩'), // Main AppBar title
        centerTitle: true,
        actions: kIsWeb && MediaQuery.of(context).size.width > 800 // 웹 환경에서만 상단 메뉴바
            ? [
                TextButton(
                  onPressed: () => _onItemTapped(0),
                  child: Text('홈', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => _onItemTapped(1),
                  child: Text('커뮤니티', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => _onItemTapped(2),
                  child: Text('투자 도구', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => _onItemTapped(3),
                  child: Text('마이', style: TextStyle(color: Colors.white)),
                ),
                // Search and Auth buttons (always visible in AppBar actions)
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StockDetailPage(symbol: 'AAPL'),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthPage(),
                      ),
                    );
                  },
                ),
              ]
            : [
                // Search and Auth buttons for mobile/narrow screens
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StockDetailPage(symbol: 'AAPL'),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthPage(),
                      ),
                    );
                  },
                ),
              ],
      ),
      body: kIsWeb && MediaQuery.of(context).size.width > 800 // 웹 환경 및 넓은 화면
          ? Row(
              children: [
                // Conditionally include FixedChatWidget
                if (_showChatOnPage[_selectedIndex]) const FixedChatWidget(),
                // Main Content Area (IndexedStack of pages)
                Expanded(
                  child: IndexedStack( // This is the main content that changes
                    index: _selectedIndex,
                    children: _pages,
                  ),
                ),
              ],
            )
          : IndexedStack( // Mobile layout (just the IndexedStack)
              index: _selectedIndex,
              children: _pages,
            ),
      bottomNavigationBar: kIsWeb && MediaQuery.of(context).size.width > 800 // 웹 환경 및 넓은 화면
          ? null // No BottomNavigationBar on web (wide screen)
          : BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: '커뮤니티',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  label: '투자 도구',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '마이',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: '채팅',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary, // Use primary color from theme
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed, // For more than 3 items
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Match app bar background
            ),
    );
  }
}

// Extract original MyHomePage content into a new StatelessWidget
class _HomePageContent extends StatelessWidget {
  const _HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Placeholder for Market Status Banner
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[800], // Changed to dark grey
            child: const Center(
              child: Text('시장 현황 배너 영역', style: TextStyle(fontSize: 18, color: Colors.white)), // Added white color
            ),
          ),
          // New: Prediction Event Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '오늘의 상승률 예측 이벤트',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  '마감 시간: 2025년 8월 12일 15:00', // Placeholder deadline
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
                SizedBox(height: 16),
                // Placeholder for event participation UI
                Container(
                  height: 100,
                  color: Colors.blueGrey[800],
                  child: Center(
                    child: Text('예측 이벤트 참여 UI 영역', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          // New: Personalization Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    '개인화 섹션',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 120,
                    color: Colors.green[900],
                    child: Center(
                      child: Text('AI 추천 종목 및 뉴스 요약', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            // New: Ranking Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '랭킹 섹션',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 150,
                    color: Colors.purple[900],
                    child: Center(
                      child: Text('인기 종목, 검색 랭킹, 토론 랭킹', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            // New: Recently Viewed Stocks Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '최근 본 종목',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 100,
                    color: Colors.orange[900],
                    child: Center(
                      child: Text('최근 본 종목 리스트', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('커뮤니티 게시판 내용이 여기에 표시됩니다.', style: TextStyle(fontSize: 20)),
    );
  }
}

class InvestmentToolsPage extends StatelessWidget {
  const InvestmentToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('포트폴리오, 시세 스크리너 등 투자 도구 내용이 여기에 표시됩니다.', style: TextStyle(fontSize: 20)),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('개인 프로필, 설정 등 마이 페이지 내용이 여기에 표시됩니다.', style: TextStyle(fontSize: 20)),
    );
  }
}
