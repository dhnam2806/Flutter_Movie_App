class Cast {
  int? castId;
  String? name;
  String? profilePath;
  String? character;

  Cast(
    this.name,
    this.profilePath,
    this.castId,
    this.character,
  );

  Cast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
  }
}
