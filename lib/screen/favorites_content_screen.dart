import 'package:flutter/material.dart';

class FavoritesContentScreen extends StatelessWidget {
  const FavoritesContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          height: 1000,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blue.shade900],
            ),
          ),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
