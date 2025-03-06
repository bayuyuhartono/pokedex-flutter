import 'package:flutter/material.dart';
import 'package:pokedex/src/View/pokemon_detail_screen.dart';
import 'package:pokedex/src/model/pokemon_model.dart';
import 'package:pokedex/src/utils/string_case_extension.dart';

class PokemonCard extends StatelessWidget {
  final PokemonResults pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    // List<String> types = pokemon["type"].split(',');

    const imageBaseUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';
    String pokemonId = pokemon.url != null  ? pokemon.url!.split("/")[6] : "";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PokemonDetailScreen(pokemon: pokemon)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff48d0b0),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  '$imageBaseUrl$pokemonId.png',
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name != null ? pokemon.name!.toCapitalized : "",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: types.map((type) => CategoryTab(text: type)).toList(),
                  // ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}