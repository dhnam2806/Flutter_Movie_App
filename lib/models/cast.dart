// class Cast {
//   int? castId;
//   String? name;
//   String? profilePath;
//   String? character;

//   Cast(
//     this.name,
//     this.profilePath,
//     this.castId,
//     this.character,
//     // {
//     //   required this.name,
//     //   required this.profilePath,
//     //   required this.castId,
//     //   required this.character, required id,
//     // }
//   );
//   String get fullProfilePath => 'https://image.tmdb.org/t/p/w200$profilePath';


//   Cast.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     profilePath = json['profile_path'];
//     castId = json['cast_id'];
//     character = json['character'];
//   }
// }

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
