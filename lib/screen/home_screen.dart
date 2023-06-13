import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);
    final _textStyle = TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      drawer: DrawerWidget(
        textStyle: _textStyle,
      ),
      //backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            height: 1000,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.blue.shade900]),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SliderHeader(
                  movies: moviesProvider.popularMovies,
                  title: 'Populares',
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(height: 5),
                SizedBox(
                  height: 20,
                ),
                CustomTextWidget2(
                  text: 'Sabemos lo que sentís',
                ),
                SizedBox(
                  height: 20,
                ),
                ProductoraWidget(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
