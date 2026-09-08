import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = NotifierProvider<SearchQueryProvider, String>(() {
  return SearchQueryProvider();
});

class SearchQueryProvider extends Notifier<String> {
  String build() {
    return '';
  }

  void updateQuery({required String query}) {
    state = query;
  }

  void clear() {
    state = '';
  }

  
}
