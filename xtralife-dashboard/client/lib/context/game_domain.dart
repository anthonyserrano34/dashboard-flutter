class GameDomain {
  final String game;
  final String domains;

  GameDomain({
    required this.game,
    required this.domains,
  });

  factory GameDomain.fromJson(Map<String, dynamic> json) {
    return GameDomain(
      game: json['name'],
      domains: json['domains'],
    );
  }
}
