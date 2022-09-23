import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:first_app/models/recipe.dart';

class RecipeApi {
  final String url = "http://localhost:3000";

  List<Recipe> parseReciope(String responseBody) {
    final parsedData = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedData
        .map<Recipe>(
          (json) => Recipe.fromJson(json),
        )
        .toList();
  }

  Future<List<Recipe>?> fetchRecipes() async {
    var uri = Uri.parse(url + "/recipes");
    // print(uri);
    final response = await http.get(uri);
    // print("Code: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      return parseReciope(response.body);
    } else {
      return [];
    }
  }
}
