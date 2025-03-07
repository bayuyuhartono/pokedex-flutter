import 'package:flutter/material.dart';
import 'package:pokedex/src/View/pokemon_detail_screen.dart';
import 'package:pokedex/src/model/pokemon_model.dart';
import 'package:pokedex/src/utils/color_utils.dart';
import 'package:pokedex/src/utils/string_case_extension.dart';
import 'package:pokedex/src/view/widgets/category_tab.dart';

class PokemonCard extends StatelessWidget {
  final PokemonResults pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PokemonDetailScreen(pokemon: pokemon)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorUtils.getColorForType(pokemon.detail?.types.first.type.name),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: pokemon.detail?.sprites.other?.officialArtwork.frontDefault != null 
                ? Image.network(
                  pokemon.detail!.sprites.other!.officialArtwork.frontDefault,
                  width: 90,
                  height: 90,
                )
                : SizedBox(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name.toCapitalized,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  pokemon.detail != null && pokemon.detail!.types.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.detail!.types
                        .map((type) => CategoryTab(text: type.type.name))
                        .expand((widget) => [widget, SizedBox(height: 8)])
                        .toList(),
                  )
                : SizedBox()
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}