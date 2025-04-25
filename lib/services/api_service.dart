import '../models/pokemon.dart';
import 'network_service.dart';

class ApiService {
  final NetworkService _networkService = NetworkService();
  final String _url =
      'https://pokeapi.co/api/v2/pokemon?limit-50'; // this should be stored elsewhere

  Future<List<Pokemon>> fetchPokemonList() async {
    final data = await _networkService.get(_url);
    final results = data['results'] as List<dynamic>;
    return results.map((json) => Pokemon.fromJson(json)).toList();
  }
}
