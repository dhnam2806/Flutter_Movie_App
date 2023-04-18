class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  // final DateTime releaseDateParsed;

  Movie(
    this.id,
    this.title,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.releaseDate,
    this.voteAverage,
  );

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'],
      json['title'],
      json['poster_path'],
      json['backdrop_path'],
      json['overview'],
      json['release_date'],
      json['vote_average']?.toDouble(),
    );
  }

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500/$posterPath';
}

class Cast {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  Cast({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  String get fullProfilePath => 'https://image.tmdb.org/t/p/w200$profilePath';

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'] ?? '',
    );
  }
}
