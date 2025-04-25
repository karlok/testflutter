class Pokemon {
  final String name;
  final String url; // check the API docs
  final int id;
  final String imageUrl;

  Pokemon({required this.name, required this.url})
      : id = _extractId(url),
        imageUrl =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_extractId(url)}.png';

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name'], url: json['url']);
  }

  // get the specific pokemon id int, as this will be used for detail and image
  static int _extractId(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return int.parse(segments[segments.length - 2]);
  }
}
