import '../models/pokemon.dart';
import '../models/pokemon_detail.dart';
import 'network_service.dart';

class ApiService {
  final NetworkService _networkService = NetworkService();
  final String _url = 'https://pokeapi.co/api/v2/pokemon?limit=100';

  Future<List<Pokemon>> fetchPokemonList() async {
    final data = await _networkService.get(_url);
    final results = data['results'] as List<dynamic>;
    return results.map((json) => Pokemon.fromJson(json)).toList();
  }

  Future<PokemonDetail> fetchPokemonDetail(String url) async {
    final data = await _networkService.get(url);
    return PokemonDetail.fromJson(data);
  }
}
