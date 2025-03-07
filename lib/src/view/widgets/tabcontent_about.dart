import 'package:flutter/material.dart';
import 'package:pokedex/src/model/pokemon_model.dart';
import 'package:pokedex/src/view/widgets/default_row.dart';

class TabContentAbout extends StatelessWidget {
  final PokemonResults pokemon;

  const TabContentAbout({
    super.key, 
    required this.pokemon,
    });

  @override
  Widget build(BuildContext context) {
    String ability = pokemon.detail!.abilities.map((item) => item.ability.name).join(", ");
    String species = pokemon.detail!.species.name;
    String height = "${pokemon.detail!.height} Inch";
    String weight = "${pokemon.detail!.weight} lbs";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          DefaultRow("Species", species),
          DefaultRow("Height", height),
          DefaultRow("Weight", weight),
          DefaultRow("Abilities", ability),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
