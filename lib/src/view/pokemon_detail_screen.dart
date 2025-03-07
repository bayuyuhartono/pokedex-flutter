import 'package:flutter/material.dart';
import 'package:pokedex/src/model/pokemon_model.dart';
import 'package:pokedex/src/utils/color_utils.dart';
import 'package:pokedex/src/view/widgets/category_tab.dart';
import 'package:pokedex/src/view/widgets/tabcontent_about.dart';
import 'package:pokedex/src/view/widgets/tabcontent_stats.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonResults pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    Color baseColor = ColorUtils.getColorForType(pokemon.detail?.types.first.type.name);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(backgroundColor: baseColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              pokemon.name,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pokemon.detail!.types
                  .map((type) => CategoryTab(text: type.type.name))
                  .expand((widget) => [widget, SizedBox(width: 8)])
                  .toList(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                pokemon.detail?.sprites.other?.officialArtwork.frontDefault ?? "",
                width: 300,
                height: 300,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: _tabSection(context, pokemon),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _tabSection(BuildContext context, PokemonResults pokemon) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TabBar(tabs: [
          Tab(text: "About"),
          Tab(text: "Stats"),
        ]),
        Expanded(
          child: TabBarView(children: [
            TabContentAbout(pokemon: pokemon),
            TabContentStats(stats: pokemon.detail!.stats),
          ]),
        ),
      ],
    ),
  );
}
