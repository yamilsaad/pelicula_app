import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../layout/layout.dart';
import '../providers/providers.dart';
import '../widgets/widget.dart';

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          height: 1500,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blue.shade900],
            ),
          ),
          child: Column(
            children: [
              LogoWidgetFlutter(),
              SizedBox(
                height: 20,
              ),
              SliderHeader(
                movies: moviesProvider.popularMovies,
                title: '¡Las más vistas!',
              ),
              SizedBox(
                height: 20,
              ),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
              ProductoraWidget(),
              SizedBox(
                height: 40,
              ),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
              ProductorasLayout(),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
