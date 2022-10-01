import 'package:flutter/foundation.dart';
import 'package:marvelgo/models/character.dart';
import '../services/services.dart';

class CharacterProvider with ChangeNotifier {
  List<Character> _characterList = [];
  List<Character> get Characters => _characterList;
  bool isLoading = true;

  Future<void> search(String nameStartWith) async {
    nameStartWith = nameStartWith.trim();
    if (nameStartWith.isNotEmpty) {
      isLoading = true;
      _characterList = [];
      notifyListeners();
      // RESPONSE 1
      String nameSearch = nameStartWith.replaceAll(" ", "-");
      var response1 = await MarvelApi().getCharacters(nameSearch);
      // RESPONSE 2
      List<Character> response2 = [];
      if (nameStartWith.contains(' ')) {
        nameSearch = nameStartWith.replaceAll(" ", "%20");
        response2 = await MarvelApi().getCharacters(nameSearch);
      }
      _characterList = [...response1, ...response2];
      //----------
      if (_characterList.isNotEmpty) isLoading = false;
    }
    notifyListeners();
  }
}
