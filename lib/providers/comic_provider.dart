import 'package:flutter/foundation.dart';
import 'package:marvelgo/models/comic.dart';
import '../services/services.dart';

class ComicProvider with ChangeNotifier {
  List<Comic> _comicList = [];
  List<Comic> get comics => _comicList;
  bool isLoading = true;

  Future<void> search(String titleStartWith) async {
    titleStartWith = titleStartWith.trim();
    if (titleStartWith.isNotEmpty) {
      isLoading = true;
      _comicList = [];
      notifyListeners();
      // RESPONSE 1
      String nameSearch = titleStartWith.replaceAll(" ", "-");
      var response1 = await MarvelApi().getComics(nameSearch);
      // RESPONSE 2
      List<Comic> response2 = [];
      if (titleStartWith.contains(' ')) {
        nameSearch = titleStartWith.replaceAll(" ", "%20");
        response2 = await MarvelApi().getComics(nameSearch);
      }
      _comicList = [...response1, ...response2];
      //----------
      if (_comicList.isNotEmpty) isLoading = false;
    }
    notifyListeners();
  }
}
