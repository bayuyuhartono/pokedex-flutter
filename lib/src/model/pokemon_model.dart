import 'package:pokedex/src/model/pokemon_detail_model.dart';

class PokemonModel {
  int count;
  String next;
  dynamic previous;
  List<PokemonResults> results;

  PokemonModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  // ✅ Add a fromJson constructor
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      count: json["count"] ?? 0,
      next: json["next"] ?? "",
      previous: json["previous"],
      results: (json["results"] as List)
          .map((item) => PokemonResults.fromJson(item))
          .toList(),
    );
  }
}

class PokemonResults {
  String name;
  String url;
  PokemonDetailModel? detail;

  PokemonResults({
    required this.name,
    required this.url,
    this.detail,
  });

  // ✅ Add a fromJson constructor
  factory PokemonResults.fromJson(Map<String, dynamic> json) {
    return PokemonResults(
      name: json["name"] ?? "",
      url: json["url"] ?? "",
    );
  }
}
