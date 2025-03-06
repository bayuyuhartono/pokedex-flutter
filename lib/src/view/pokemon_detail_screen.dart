import 'package:flutter/material.dart';
import 'package:pokedex/src/model/pokemon_model.dart';
import 'package:pokedex/src/view/widgets/category_tab.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonResults pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff48d0b0),
      appBar: AppBar(backgroundColor: const Color(0xff48d0b0)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Base Stats", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  StatRow("HP", 45),
                  StatRow("Attack", 60),
                  StatRow("Defense", 50),
                  StatRow("Speed", 65),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  final String label;
  final int value;

  StatRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 18)),
        SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            value: value / 100,
            color: Colors.blue,
            backgroundColor: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}