import 'package:flutter/material.dart';
import 'package:pelicula_app/providers/movies_providers.dart';
import 'package:pelicula_app/providers/providers.dart';
import 'package:provider/provider.dart';

import 'screen/screen.dart';
import 'themes/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => SearchProvider(), lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video Club',
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(),
        },
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
