class PokemonDetailModel {
  List<Ability> abilities;
  int baseExperience;
  Cries cries;
  List<Species> forms;
  List<GameIndex> gameIndices;
  int height;
  List<dynamic> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Move> moves;
  String name;
  int order;
  List<dynamic> pastAbilities;
  List<dynamic> pastTypes;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  int weight;

  PokemonDetailModel({
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  // ✅ Add fromJson constructor
  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      abilities: (json['abilities'] as List)
          .map((item) => Ability.fromJson(item))
          .toList(),
      baseExperience: json['base_experience'] ?? 0,
      cries: Cries.fromJson(json['cries']),
      forms: (json['forms'] as List)
          .map((item) => Species.fromJson(item))
          .toList(),
      gameIndices: (json['game_indices'] as List)
          .map((item) => GameIndex.fromJson(item))
          .toList(),
      height: json['height'] ?? 0,
      heldItems: json['held_items'] ?? [],
      id: json['id'] ?? 0,
      isDefault: json['is_default'] ?? false,
      locationAreaEncounters: json['location_area_encounters'] ?? "",
      moves: (json['moves'] as List)
          .map((item) => Move.fromJson(item))
          .toList(),
      name: json['name'] ?? "",
      order: json['order'] ?? 0,
      pastAbilities: json['past_abilities'] ?? [],
      pastTypes: json['past_types'] ?? [],
      species: Species.fromJson(json['species']),
      sprites: Sprites.fromJson(json['sprites']),
      stats: (json['stats'] as List)
          .map((item) => Stat.fromJson(item))
          .toList(),
      types: (json['types'] as List)
          .map((item) => Type.fromJson(item))
          .toList(),
      weight: json['weight'] ?? 0,
    );
  }
}

class Ability {
  Species ability;
  bool isHidden;
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      ability: Species.fromJson(json['ability']),
      isHidden: json['is_hidden'] ?? false,
      slot: json['slot'] ?? 0,
    );
  }
}

class Species {
  String name;
  String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'] ?? "",
      url: json['url'] ?? "",
    );
  }
}


class Cries {
  String latest;
  String legacy;

  Cries({
    required this.latest,
    required this.legacy,
  });

  factory Cries.fromJson(Map<String, dynamic> json) {
    return Cries(
      latest: json['latest'] ?? "",
      legacy: json['legacy'] ?? "",
    );
  }
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;
  Other? other;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      backDefault: json['back_default'] ?? "",
      backFemale: json['back_female'],
      backShiny: json['back_shiny'] ?? "",
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'] ?? "",
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'] ?? "",
      frontShinyFemale: json['front_shiny_female'],
      other: json['other'] != null ? Other.fromJson(json['other']) : null,
    );
  }
}

class Other {
  DreamWorld dreamWorld;
  Home home;
  OfficialArtwork officialArtwork;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) {
    return Other(
      dreamWorld: DreamWorld.fromJson(json['dream_world']),
      home: Home.fromJson(json['home']),
      officialArtwork: OfficialArtwork.fromJson(json['official-artwork']),
    );
  }
}

class DreamWorld {
  String frontDefault;
  dynamic frontFemale;

  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) {
    return DreamWorld(
      frontDefault: json['front_default'] ?? "",
      frontFemale: json['front_female'],
    );
  }
}

class GameIndex {
  int gameIndex;
  Species version;

  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return GameIndex(
      gameIndex: json['game_index'] ?? 0,
      version: Species.fromJson(json['version']),
    );
  }
}

class Move {
  Species move;
  List<VersionGroupDetail> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      move: Species.fromJson(json['move']),
      versionGroupDetails: (json['version_group_details'] as List)
          .map((item) => VersionGroupDetail.fromJson(item))
          .toList(),
    );
  }
}

class VersionGroupDetail {
  int levelLearnedAt;
  Species moveLearnMethod;
  Species versionGroup;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetail(
      levelLearnedAt: json['level_learned_at'] ?? 0,
      moveLearnMethod: Species.fromJson(json['move_learn_method']),
      versionGroup: Species.fromJson(json['version_group']),
    );
  }
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      baseStat: json['base_stat'] ?? 0,
      effort: json['effort'] ?? 0,
      stat: Species.fromJson(json['stat']),
    );
  }
}

class OfficialArtwork {
  String frontDefault;
  String? frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return OfficialArtwork(
      frontDefault: json['front_default'] ?? '',
      frontShiny: json['front_shiny'],
    );
  }
}

class Home {
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    required this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      frontDefault: json['front_default'] ?? '',
      frontShiny: json['front_shiny'] ?? '',
      frontFemale: json['front_female'],
      frontShinyFemale: json['front_shiny_female'],
    );
  }
}

class Type {
  int slot;
  Species type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      slot: json['slot'] ?? 0,
      type: Species.fromJson(json['type']),
    );
  }
}
