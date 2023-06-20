import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../models/model.dart';
import 'widget.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Column(
      children: [
        Divider(height: 5),
        SizedBox(height: 5),
        CustomTextWidget2(
          text: 'Las mejor calificadas:',
        ),
        Container(
          width: double.infinity, //*Toma todo el ancho de la pantalla posible!
          height: size.height * 0.5,
          //color: Colors.red,
          //El Swiper nos permite formar un carrusel!!!
          child: Swiper(
            itemCount: movies.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.6,
            itemHeight: size.height * 0.4,
            itemBuilder: (BuildContext context, int index) {
              final movie = movies[index];
              movie.heroId = 'swiper-${movie.id}';
              //*el FadeInImage es para una imagen de carga!
              //*el GestureDectector con la propiedad onTap nos permite navegar a otra pantalla al tocar las tarjetas!
              return GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, 'details', arguments: movie),
                child: Hero(
                  tag: movie.heroId!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Divider(height: 5),
      ],
    );
  }
}
