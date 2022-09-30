class Character {
  final String id;
  final String name;
  final String thumbnail;
  final String description;

  Character(
      {required this.id,
      required this.thumbnail,
      required this.name,
      required this.description});

  factory Character.fromJSON(Map<String, dynamic> map) {
    return Character(
      id: map['id'].toString(),
      name: map['name'],
      thumbnail: map['thumbnail']['path'] + '.' + map['thumbnail']['extension'],
      description: map['description'],
    );
  }
}
