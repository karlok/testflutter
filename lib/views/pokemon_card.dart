import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: child: Text(
          pokemon.name.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
