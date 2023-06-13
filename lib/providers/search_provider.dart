import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  String searchText = '';
  bool showSearchField = false;

  void setSearchText(String text) {
    searchText = text;
    notifyListeners();
  }

  void toggleSearchField() {
    showSearchField = !showSearchField;
    notifyListeners();
  }

  //TODO Lógica de búsqueda de películas.
}
