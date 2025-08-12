import 'package:flutter/material.dart';

class InvestmentToolsPage extends StatelessWidget {
  const InvestmentToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '투자 도구',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.displayLarge?.color),
              ),
              SizedBox(height: 24),

              // Portfolio Management
              Card(
                color: Theme.of(context).colorScheme.surface, // Use theme surface color
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('포트폴리오 관리', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.displayLarge?.color)),
                      SizedBox(height: 8),
                      Text('보유 종목 관리 및 수익률 분석', style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to Portfolio Management page
                        },
                        child: Text('포트폴리오 보기'),
                      ),
                    ],
                  ),
                ),
              ),

              // Screener
              Card(
                color: Theme.of(context).colorScheme.surface,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('시세 스크리너', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.displayLarge?.color)),
                      SizedBox(height: 8),
                      Text('원하는 조건으로 종목 검색', style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to Screener page
                        },
                        child: Text('스크리너 실행'),
                      ),
                    ],
                  ),
                ),
              ),

              // AI News Summary
              Card(
                color: Theme.of(context).colorScheme.surface,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('AI 기반 뉴스 요약', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.displayLarge?.color)),
                      SizedBox(height: 8),
                      Text('AI가 분석한 최신 뉴스 요약', style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to AI News Summary page
                        },
                        child: Text('뉴스 요약 보기'),
                      ),
                    ],
                  ),
                ),
              ),

              // Expert/Influencer Content Curation
              Card(
                color: Theme.of(context).colorScheme.surface,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('전문가/인플루언서 콘텐츠', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.displayLarge?.color)),
                      SizedBox(height: 8),
                      Text('엄선된 투자 정보 및 분석', style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to Expert Content page
                        },
                        child: Text('콘텐츠 보기'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}