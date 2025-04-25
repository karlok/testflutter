import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/pokemon.dart';
import '../views/pokemon_detail_view.dart';

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
      child: Card(
        elevation: 4,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Hero(
            // does the nifty anim from List to Detail - very cool!
            tag: pokemon.name,
            child: CachedNetworkImage(
                imageUrl: pokemon.imageUrl,
                height: 100,
                width: 100,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (content, url, error) => Icon(Icons.error)),
          ),
          SizedBox(height: 8),
          Text(pokemon.name.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}
