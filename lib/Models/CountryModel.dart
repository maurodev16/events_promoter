class CountryModel {
  final String name;
  final List<String> languages;
  final String emoji;
  final String emojiUnicode;
  final String capital;
  final String continent;
  final String currency;

  CountryModel({
    required this.name,
    required this.languages,
    required this.emoji,
    required this.emojiUnicode,
    required this.capital,
    required this.continent,
    required this.currency,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      languages: List<String>.from(json['languages']),
      emoji: json['emoji'],
      emojiUnicode: json['emojiUnicode'],
      capital: json['capital'],
      continent: json['continent'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'languages': languages,
      'emoji': emoji,
      'emojiUnicode': emojiUnicode,
      'capital': capital,
      'continent': continent,
      'currency': currency,
    };
  }
}
