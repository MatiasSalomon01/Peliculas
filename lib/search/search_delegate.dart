import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [Text('buildActions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return Text('buildLeading');
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text('buildSuggestions: $query');
  }
}
