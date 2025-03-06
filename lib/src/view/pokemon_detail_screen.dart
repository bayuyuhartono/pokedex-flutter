import 'package:flutter/material.dart';
import 'package:pokedex/src/model/pokemon_model.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonResults pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff48d0b0),
      appBar: AppBar(title: Text(pokemon.name ?? ""), backgroundColor: const Color(0xff48d0b0)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              pokemon.name ?? "",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Text(
          //     "Type: ${pokemon["type"]}",
          //     style: TextStyle(fontSize: 18, color: Colors.white70),
          //   ),
          // ),
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