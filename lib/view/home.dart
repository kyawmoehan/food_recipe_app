import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/recipe.dart';
import '../providers/recipes.dart';

import '../widgets/recipe_card.dart';

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
    await Provider.of<Recipes>(context, listen: false).fetchAndSetRecipes();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _recipes = Provider.of<Recipes>(context).recipes;
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
                  id: _recipes[i].id,
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
