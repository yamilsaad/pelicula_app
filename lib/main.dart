import 'package:flutter/material.dart';
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
        ChangeNotifierProvider.value(value: LoginFormProvider()),
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => SearchProvider(), lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video Club',
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          //'register': (context) => const RegisterScreen(),
          'home': (context) => HomeScreen(),
          'details': (context) => MoviesScreen(),
        },
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
