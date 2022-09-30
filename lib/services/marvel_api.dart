import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvelgo/models/models.dart';
import 'package:crypto/crypto.dart' as crypto;

const _urlLink = 'https://gateway.marvel.com:443/v1/public/';
const _publicKey = 'c7abe46e9a5a687b4b86b08e2d07390b';
const _privateKey = '9240283774cb0b437601e74f6357d7ad31df9779';

class MarvelApi {
  auth() {
    String param = 'limit=50';

    String ts = DateTime.now().microsecondsSinceEpoch.toString();

    var data = ts + _privateKey + _publicKey; // data being hashed

    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return '$param&ts=$ts&apikey=$_publicKey&hash=$digest';
  }

  Future<List<Character>> getCharacter(String name) async {
    String endpoint = 'characters?nameStartsWith=$name&';

    List<Character> characterList = [];
    print("$_urlLink$endpoint${auth()}");
    Uri url = Uri.parse("$_urlLink$endpoint${MarvelApi().auth()}");
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "Ok") {
      for (var element in jsonData["data"]["results"]) {
        characterList.add(Character.fromJSON(element));
      }
    }
    return characterList;
  }
}
