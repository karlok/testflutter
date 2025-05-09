import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/api_service.dart';
import '../models/pokemon.dart';
import '../models/pokemon_detail.dart';
import '../models/type_color.dart';
import '../widgets/animated_gradient_background.dart';

// StatefulWidget (configuration only)
class PokemonDetailView extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetailView({required this.pokemon});

  @override
  _PokemonDetailViewState createState() =>
      _PokemonDetailViewState(); // creates the State
}

// State class (holds data + builds UI)
class _PokemonDetailViewState extends State<PokemonDetailView> {
  PokemonDetail? pokemonDetail;
  bool isLoading = true;

  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    loadDetail(); // _this_ is now where the data is fetched for the detail screen
  }

  Future<void> loadDetail() async {
    final detail = await apiService.fetchPokemonDetail(widget.pokemon.url);
    setState(() {
      pokemonDetail = detail;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color mainTypeColor = getTypeColor(
      pokemonDetail?.types.first ?? 'normal',
    );
    final Color lighterTypeColor = lighterColor(
      mainTypeColor,
      0.4, // 40% lighter
    );
    return Scaffold(
      extendBodyBehindAppBar: true, // show the gradient behind the app bar
      // backgroundColor: pokemonDetail != null && pokemonDetail!.types.isNotEmpty
      //     ? getTypeColor(pokemonDetail!.types.first)
      //     : Colors.white,
      appBar: AppBar(
        title: Text(widget.pokemon.name.toUpperCase()),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          AnimatedGradientBackground(
            colors1: [mainTypeColor, Colors.white],
            colors2: [lighterTypeColor, Colors.white],
            duration: Duration(seconds: 10),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.pokemon.name,
                  child: CachedNetworkImage(
                    imageUrl: widget.pokemon.imageUrl,
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),
                if (isLoading)
                  CircularProgressIndicator()
                else
                  Column(
                    children: [
                      Text(pokemonDetail!.name.toUpperCase(),
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text("Height: ${pokemonDetail!.height / 10} m", style: TextStyle(fontSize: 20)),
                      Text("Weight: ${pokemonDetail!.weight / 10} kg", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        children: pokemonDetail!.types
                            .map((type) => Chip(
                          label: Text(type.toUpperCase()),
                          backgroundColor: Colors.white.withOpacity(0.8),
                        ))
                            .toList(),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
