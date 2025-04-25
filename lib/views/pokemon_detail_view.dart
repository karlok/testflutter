import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: pokemon.name,
              child: CachedNetworkImage(
                imageUrl: pokemon.imageUrl,
                height: 200,
                width: 200,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 20),
            Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            // We can add stats/details below later
          ],
        ),
      ),
    );
  }
}
