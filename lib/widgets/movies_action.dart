import 'package:flutter/material.dart';

import '../models/model.dart';

class MoviesByGenreWidget extends StatelessWidget {
  final List<Movie> movies;
  final int genreId; // ID del género que deseas mostrar

  MoviesByGenreWidget({required this.movies, required this.genreId});

  @override
  Widget build(BuildContext context) {
    // Filtrar las películas por género
    List<Movie> filteredMovies =
        movies.where((movie) => movie.genreIds.contains(genreId)).toList();

    return Row(
      children: filteredMovies.map((movie) => _MovieCard(movie)).toList(),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final Movie movie;

  _MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          movie.fullPosterImg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
