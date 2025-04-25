import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailView(pokemon: pokemon),
          ),
        );
      },
    child Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: pokemon.name,
            child: CachedNetworkImage( // loads and caches image
              imageUrl: pokemon.imageUrl,
              height: 100,
              width: 100,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (content, url) => Icon(Icons.error)
            ),
          ),
          SizedBox(height: 8),
          Text(
            pokemon.name.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold))
        ),
    );
  }
}
