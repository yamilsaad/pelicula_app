import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import 'widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return AppBar(
      toolbarHeight: 75.0,
      flexibleSpace: Container(
        height: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue.shade900],
          ),
        ),
      ),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            searchProvider.toggleSearchField();
          },
          icon: const Icon(
            Icons.search,
            size: 35,
            color: Colors.white,
          ),
        ),
      ],
      centerTitle: true,
      title: searchProvider.showSearchField
          ? Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10), // Ajusta la altura aquí
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
                onChanged: (value) {
                  searchProvider.setSearchText(value);
                },
              ),
            )
          : null,
    );
  }
}
