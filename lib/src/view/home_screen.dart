import 'package:flutter/material.dart';
import 'package:pokedex/src/data/response/api_status.dart';
import 'package:pokedex/src/view/widgets/pokemon_card.dart';
import 'package:pokedex/src/viewmodel/home_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeVM viewModel = HomeVM();

  @override
  void initState() {
    viewModel.fetchPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text(
        "Pokedex", 
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          )
      )),
      body: ChangeNotifierProvider<HomeVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<HomeVM>(builder: (context, viewModel, _) {
          switch (viewModel.pokemonModel.status) {
            case ApiStatus.completed:
              return GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemCount: viewModel.pokemonModel.data?.results.length ?? 0,
                itemBuilder: (context, index) {
                  final pokemon = viewModel.pokemonModel.data!.results[index];
                  return PokemonCard(pokemon: pokemon);
                },
              );
            default:
          }
          return Container();
        }),
      ),
    );
  }
}