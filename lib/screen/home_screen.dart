import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widget.dart';
import 'screen.dart';

//Esta es la pantalla principal donde se muestra las dos pestañas:
//HomeScreenContent y FavoritesContentScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //Uso los providers para mostrar las peliculas y aplicar el buscador en distintas pantallas.
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);
    //este TextStyle es Drawer(debo revisarlo)
    final _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    //Lista que contiene instancias de los dos widgets de las pantallas mostradas.
    final List<Widget> _screens = [
      HomeScreenContent(),
      FavoritesContentScreen(),
    ];

    return Scaffold(
      //El uso del PreferredSize me ayuda a darle efecto al textField.
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      drawer: DrawerWidget(
        textStyle: _textStyle,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        //_currentIndex realiza seguimiento de las pestañas seleccionadas.
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          //Barra Inferior con pestañas.
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          //Barra Inferior con pestañas.
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
