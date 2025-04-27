import 'package:flutter/material.dart';

Color lighterColor(Color color, [double amount = 0.3]) {
  return Color.lerp(color, Colors.white, amount)!;
}

Color getTypeColor(String type) {
  switch (type) {
    case 'fire':
      return Colors.redAccent;
    case 'water':
      return Colors.blueAccent;
    case 'grass':
      return Colors.green;
    case 'electric':
      return Colors.yellow.shade700;
    case 'ice':
      return Colors.cyanAccent;
    case 'fighting':
      return Colors.orange;
    case 'poison':
      return Colors.purple;
    case 'ground':
      return Colors.brown;
    case 'flying':
      return Colors.indigoAccent;
    case 'psychic':
      return Colors.pinkAccent;
    case 'bug':
      return Colors.lightGreen;
    case 'rock':
      return Colors.grey;
    case 'ghost':
      return Colors.deepPurple;
    case 'dragon':
      return Colors.deepPurpleAccent;
    case 'dark':
      return Colors.black54;
    case 'steel':
      return Colors.blueGrey;
    case 'fairy':
      return Colors.pink;
    default:
      return Colors.grey.shade300;
  }
}
