import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      toolbarHeight: 90,
      // Otros ajustes de estilo de la AppBar en el tema claro
    ),
    // Otros ajustes y propiedades para el tema claro
  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      toolbarHeight: 70,
      // Otros ajustes de estilo de la AppBar en el tema oscuro
    ),
    // Otros ajustes y propiedades para el tema oscuro
  );
}
