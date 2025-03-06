

import 'package:flutter/material.dart';
import 'package:pokedex/src/data/response/api_response.dart';
import 'package:pokedex/src/model/pokemon_model.dart';
import 'package:pokedex/src/repository/pokemon_repository.dart';

class HomeVM extends ChangeNotifier {
  final _myRepo = PokemonRepo();

  ApiResponse<PokemonModel> pokemonModel = ApiResponse.loading();

  void _setPokemonMain(ApiResponse<PokemonModel> response) {
    print("Response: $response");
    pokemonModel = response;
    notifyListeners();
  }

  Future<void> fetchPokemonData() async {
    _setPokemonMain(ApiResponse.loading());
    _myRepo
        .getPokemonData("pokemon?limit=12&offset=12")  
        .then((value) => _setPokemonMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setPokemonMain(ApiResponse.error(error.toString())));
  }
}