import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MovieService {
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _apiKey = '97d39b50c99a2fd2db9f2ed346557b45';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/movie/popular?api_key=$_apiKey"),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      final List<Movie> movies =
          data.map((movieData) => Movie.fromJson(movieData)).toList();
      return movies;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
