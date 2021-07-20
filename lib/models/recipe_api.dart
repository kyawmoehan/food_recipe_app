import 'dart:convert';

import './recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", '/feeds/list', {
      "start": "0",
      "limit": "18",
      "tag": "list.recipe.popular",
    });
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "ddf542925cmshdcef509621c9c15p17b8dbjsn16b58a203c91",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": 'true',
    });
    Map data = json.decode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapShot(_temp);
  }
}
