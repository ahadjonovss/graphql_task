class CountryModel {
  const CountryModel({
    required this.name,
    required this.capital,
    required this.currency,
    required this.emoji,
    required this.native,
    required this.countryCode
  });

  final String name;
  final String native;
  final String capital;
  final String emoji;
  final String currency;
  final String countryCode;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    name: json['name'] as String? ?? "",
    native: json['native'] as String? ?? "",
    capital: json['capital'] as String? ?? "",
    emoji: json['emoji'] as String? ?? "",
    currency: json['currency'] as String? ?? "",
    countryCode: json["code"]??""

  );
}