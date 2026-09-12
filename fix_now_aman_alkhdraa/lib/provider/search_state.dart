import '/models/service_model.dart';

class SearchState {
  final String query;
  final List<ServiceModel> searchResult;
  SearchState({
    required this.query,
    required this.searchResult,
  });
}
