class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  Movie(
      // this.id,
      // this.title,
      // this.posterPath,
      // this.backdropPath,
      // this.overview,
      // this.releaseDate,
      // this.voteAverage,
      {
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      // json['id'],
      // json['title'],
      // json['poster_path'],
      // json['backdrop_path'],
      // json['overview'],
      // json['release_date'],
      // json['vote_average']?.toDouble(),
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average']?.toDouble(),
    );
  }

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500/$posterPath';
}

// class Cast {
//   final int id;
//   final String name;
//   final String character;
//   final String profilePath;

//   Cast({
//     required this.id,
//     required this.name,
//     required this.character,
//     required this.profilePath,
//   });

//   String get fullProfilePath => 'https://image.tmdb.org/t/p/w200$profilePath';

//   factory Cast.fromJson(Map<String, dynamic> json) {
//     return Cast(
//       id: json['id'],
//       name: json['name'],
//       character: json['character'],
//       profilePath: json['profile_path'] ?? '',
//     );
//   }
// }
