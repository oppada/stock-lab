import 'package:flutter/material.dart';

class StockSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close the search screen without a result
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // This is where you'd display search results based on 'query'
    // For now, we navigate to the detail page directly
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (query.isNotEmpty) {
        close(context, query); // Close search and return the query as result
      } else {
        close(context, ''); // Close without result if query is empty
      }
    });
    return Center(
      child: Text(
        '검색 결과: "$query"' ,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This is where you'd display search suggestions as the user types
    final List<String> suggestionList = query.isEmpty
        ? ['삼성전자', '카카오', '네이버'] // Recent searches or popular stocks
        : ['삼성전자', '카카오', '네이버'] // Filtered suggestions based on query
            .where((element) => element.contains(query))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            close(context, suggestionList[index]); // Close search and return selected suggestion
          },
        );
      },
    );
  }
}