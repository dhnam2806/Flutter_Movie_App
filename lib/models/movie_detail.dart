import 'movie.dart';

class MovieDetail {
  final Movie movie;
  final List<Cast> cast;

  MovieDetail({required this.movie, required this.cast});

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    final movie = Movie.fromJson(json);
    final castJson = json['credits']['cast'] as List<dynamic>;
    final cast = castJson.map((json) => Cast.fromJson(json)).toList();
    return MovieDetail(movie: movie, cast: cast);
  }
}
