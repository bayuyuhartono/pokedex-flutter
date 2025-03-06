class PokemonModel {
  int? count;
  String? next;
  String? previous;
  List<PokemonResults>? results;

  PokemonModel({this.count, this.next, this.previous, this.results});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PokemonResults>[];
      json['results'].forEach((v) {
        results!.add(new PokemonResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonResults {
  String? name;
  String? url;

  PokemonResults({this.name, this.url});

  PokemonResults.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}