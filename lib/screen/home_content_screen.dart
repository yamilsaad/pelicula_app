import 'package:flutter/material.dart';
import 'package:pelicula_app/widgets/card_swiper.dart';
import 'package:pelicula_app/widgets/other_scroll.dart';
import 'package:provider/provider.dart';

import '../layout/layout.dart';
import '../providers/providers.dart';
import '../widgets/widget.dart';

//Cree una pantalla aparte para contener los widgets que se muestren en
//la pestaña del home. Ambas pestañas, tanto el home como favoritos,
//donde se van a ver las favoritas seleccionadas, se muestran la
//pantalla del HomeScreen.

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return SingleChildScrollView(
      //el scrollview permite el scroll.
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          height: 2780,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //el gradient es para el fondo de la pantalla.
              colors: [Colors.black, Colors.blue.shade900],
            ),
          ),
          child: Column(
            children: [
              //Logo con nombre de la app.
              LogoWidgetFlutter(),
              SizedBox(
                height: 20,
              ),
              //Slider con peliculas Populares.
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
              //Posibles botones con información de proveedores de peliculas.
              ProductorasLayout(),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
              //Películas próximas a salir.
              UpcommingScroll(
                movies: moviesProvider.upCommingMovies,
              ),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
              //Peliculas en un Carrusel.
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
              //Posible botones.
              ProductoraWidget(),
              SizedBox(
                height: 40,
              ),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
              //Otros scrolls de películas.
              OtherScrolls(
                movies: moviesProvider.popularMovies,
              ),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
              //Otros scrolls de películas.
              OtherScrolls(
                movies: moviesProvider.popularMovies,
              ),
              Divider(height: 5),
              SizedBox(
                height: 20,
              ),
              //Mi nombre.
              YamilSaad(),
            ],
          ),
        ),
      ),
    );
  }
}

class YamilSaad extends StatelessWidget {
  const YamilSaad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextWidget(
        text: 'by Yamil Saad Developer',
      ),
    );
  }
}
