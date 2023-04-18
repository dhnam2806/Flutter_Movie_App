import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../models/movie_detail.dart';

class ApiHandle {
  static const _apiKey = '97d39b50c99a2fd2db9f2ed346557b45';
  static const _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchData(String data) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/${data}?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['results'];
      return jsonList.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getTrendingMovie() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/trending/movie/day?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['results'];
      return jsonList.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Cast> getMovieCredit(int movieId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/$movieId/credit?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final cast = Cast.fromJson(body);
      return cast;
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
