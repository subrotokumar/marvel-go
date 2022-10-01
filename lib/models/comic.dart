import 'package:flutter/foundation.dart';

class Comic {
  final String id;
  final String title;
  final String images;

  Comic({
    required this.id,
    required this.title,
    required this.images,
  });

  factory Comic.fromJSON(Map<String, dynamic> map) {
    return Comic(
      id: map['id'].toString(),
      title: map['title'],
      images: map['images'][0]['path'] + '.' + map['images'][0]['extension'],
    );
  }
}
