import 'dart:convert';

import '../models/movie_detail.dart';
import 'package:http/http.dart' as http;


class MovieDetailService {
  static const String _baseUrl = "https://api.themoviedb.org/3/movie";
  static const String _apiKey = "your_api_key_here";

  Future<MovieDetail> getMovieDetail(int movieId) async {
    final url = Uri.parse("$_baseUrl/$movieId?api_key=$_apiKey&append_to_response=credits");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final MovieDetail movieDetail = MovieDetail.fromJson(data);
      return movieDetail;
    } else {
      throw Exception('Failed to load movie detail');
    }
  }
}
