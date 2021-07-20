import 'package:flutter/material.dart';

import '../widgets/recipe_card.dart';

import '../models/recipe.dart';
import '../models/recipe_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  var _isLoading = true;

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
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
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipe'),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (ctx, i) {
                return RecipeCard(
                  title: _recipes[i].name,
                  cookTime: _recipes[i].totalTime,
                  rating: _recipes[i].rating.toString(),
                  thumbnailUrl: _recipes[i].images,
                );
              },
            ),
    );
  }
}
