

import 'package:pokedex/src/data/network/base_api_service.dart';
import 'package:pokedex/src/data/network/network_api_service.dart';
import 'package:pokedex/src/model/pokemon_detail_model.dart';
import 'package:pokedex/src/model/pokemon_model.dart';

class PokemonRepo {

  final BaseApiService _apiService = NetworkApiService();

  Future<PokemonModel?> getPokemonData(String uri) async {
    try {
      dynamic response = await _apiService.getResponse(uri);
      // print("Log pokemon: $response");
      final jsonData = PokemonModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonDetailModel?> getPokemonDetailData(String uri) async {
    try {
      dynamic response = await _apiService.getResponse(uri);
      final jsonData = PokemonDetailModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

}