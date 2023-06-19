import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/model.dart';

//!el ChangeNotifier que es parte del paquete de material notifica al main donde se construye el provider para que funcione!!!

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'a54584820334aa19418518000aeecbbe';
  String _baseUrl = 'api.themoviedb.org';
  String _lenguage = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upCommingMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    print('Movies Provider Inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
    this.getUpComming();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _lenguage, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = Welcome.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularResponse.results, ...popularResponse.results];
    notifyListeners();
  }

  getUpComming() async {
    var url = Uri.https(_baseUrl, '3/movie/upcoming',
        {'api_key': _apiKey, 'language': _lenguage, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final upcomming = Up.fromJson(response.body);

    upCommingMovies = upcomming.results;

    notifyListeners();
  }
}
