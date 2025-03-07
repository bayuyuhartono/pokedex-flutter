import 'package:flutter/material.dart';
import 'package:pokedex/src/model/pokemon_detail_model.dart';
import 'package:pokedex/src/view/widgets/stat_row.dart';

class TabContentStats extends StatelessWidget {
  final List<Stat> stats;

  const TabContentStats({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
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
          ...stats.map((item) => StatRow(item.stat.name, item.baseStat)),
        ],
      ),
    );
  }
}
