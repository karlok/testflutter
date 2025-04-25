import '../models/pokemon.dart';
import '../services/api_service.dart';

class PokemonListViewmodel {
  final ApiService _apiService = ApiService();
  List<Pokemon> pokemons = [];

  Future<void> loadPokemons() async {
    pokemons = await _apiService.fetchPokemonList();
  }
}
