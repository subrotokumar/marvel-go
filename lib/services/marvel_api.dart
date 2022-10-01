import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvelgo/models/models.dart';
import 'package:crypto/crypto.dart' as crypto;
import '../utils/constants.dart';

const urlLink = 'https://gateway.marvel.com:443/v1/public/';

class MarvelApi {
  auth({String param = 'limit=60'}) {
    String ts = DateTime.now().microsecondsSinceEpoch.toString();

    var data = ts + privateKey + publicKey; // data being hashed

    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return '$param&ts=$ts&apikey=$publicKey&hash=$digest';
  }

  Future<List<Character>> getCharacters(String name) async {
    String endpoint = 'characters?nameStartsWith=$name&';

    List<Character> characterList = [];
    print("$urlLink$endpoint${auth()}");
    Uri url = Uri.parse("$urlLink$endpoint${MarvelApi().auth()}");
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "Ok") {
      for (var element in jsonData["data"]["results"]) {
        characterList.add(Character.fromJSON(element));
      }
    }
    return characterList;
  }

  Future<List<Comic>> getComics(String name) async {
    String endpoint =
        name.isEmpty ? 'comics?&' : 'comics?titleStartsWith=$name&';

    List<Comic> comicList = [];
    print(
        "$urlLink$endpoint${MarvelApi().auth(/*param: 'issueNumber=1&limit=50'*/)}");
    Uri url = Uri.parse(
        "$urlLink$endpoint${MarvelApi().auth(/*param: 'issueNumber=1&limit=50'*/)}");
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "Ok") {
      for (var element in jsonData["data"]["results"]) {
        print(element['title']);
        comicList.add(Comic.fromJSON(element));
      }
    }
    return comicList;
  }
}
