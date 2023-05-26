class ArtistsModel {
  final String? name;
  final String? genre;
  final String? avatarUrl;

  ArtistsModel({
    this.name,
    this.genre,
    this.avatarUrl,
  });

  factory ArtistsModel.fromJson(Map<String, dynamic> json) {
    return ArtistsModel(
      name: json['name'],
      genre: json['genre'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'genre': genre,
      'avatarUrl': avatarUrl,
    };
  }
}
