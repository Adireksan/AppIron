import 'package:flutter/material.dart';

import 'package:first_app/data/recipe_api.dart';
// import 'package:first_app/data/recipe_data.dart';
import 'package:first_app/models/recipe.dart';
import 'package:first_app/pages/recipe_card.dart';
//import 'package:first_app/pages/recipe_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    recipes = await RecipeApi().fetchRecipes() ?? [];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text('ก. ธนวัฒน์ สตีล เซนเตอร์ จำกัด'),
          ],
        ),
      ),
      // body: const RecipeCard(
      //   title: "Homemade Strawberry Jam",
      //   rating: "5",
      //   cookTime: "30 min",
      //   thumbnailUrl:
      //       "https://lh3.googleusercontent.com/Sd_u2O9p_hwxK4xix_puCGAxWxtf7XyLe1Fhld-4xvxLGo39fYNEiOnij-sT_qn2jZDqWsnv393bqgD1ijoo7Q=s360",
      // ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          // ? Text(_isLoading.toString())
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  title: recipes[index].name,
                  rating: recipes[index].rating.toString(),
                  cookTime: recipes[index].totalTime,
                  thumbnailUrl: recipes[index].images,
                );
              },
            ),
    );
  }
}
