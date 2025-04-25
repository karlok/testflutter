import 'package:flutter/material.dart';
import '../viewmodels/pokemon_list_viewmodel.dart';

class PokemonListView extends StatefulWidget {
  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  final viewModel = PokemonListViewmodel();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await viewModel.loadPokemons();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémon'))
      body: isLoading
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: viewModel.pokemons.length,
            itemBuilder: (context, index) {
              return PokemonCard(pokemon: viewModel.pokemons[index]);
            },
          ),
    );
  }
}
