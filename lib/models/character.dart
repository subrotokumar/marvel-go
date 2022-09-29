class Character {
  final String id;
  final String name;
  final String thumbnail;

  Character({required this.id, required this.thumbnail, required this.name});

  factory Character.fromJSON(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      thumbnail: map['thumbnail']['path'] + map['thumbnail']['extension'],
      name: map['name'],
    );
  }
}
