import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvelgo/models/models.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

class MarvelApi {
  /*
  Authentication for Server-Side Applications
  Server-side applications must pass two parameters in addition to the apikey parameter:

  ts - a timestamp (or other long string which can change on a request-by-request basis)
  hash - a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
  For example, a user with a public key of "1234" and a private key of "abcd" could construct a valid call as follows: 
  http://gateway.marvel.com/v1/public/comics?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150 (the hash value is the md5 digest of 1abcd1234)

  */
  static const urlLink = 'https://gateway.marvel.com:443/v1/public/';
  String auth() {
    const publicKey = 'c7abe46e9a5a687b4b86b08e2d07390b';
    const privateKey = '9240283774cb0b437601e74f6357d7ad31df9779';

    String ts = DateTime.now().toString();

    var bytes = utf8.encode(ts + privateKey + publicKey); // data being hashed
    var hash = md5.convert(bytes);
    return 'ts=$ts&apiKey=$publicKey&hash=$hash';
  }

  static Future<List<Character>> getCharacter() async {
    String endpoint = 'characters?nameStartsWith=spider&';
    try {
      List<Character> characterList = [];
      Uri url = Uri.parse("$urlLink$endpoint${MarvelApi().auth()}");
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body) as List<dynamic>;
      for (var character in jsonData) {
        Character entry = Character.fromJSON(character);
        // print(token);
        characterList.add(entry);
      }
      return characterList;
    } catch (e) {
      return [];
    }
  }
}
