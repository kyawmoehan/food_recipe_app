import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './view/home.dart';
import './view/recipe_detail.dart';

import './providers/recipes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Recipes(),
        ),
      ],
      child: MaterialApp(
        title: 'Food Recipe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: HomePage(),
        routes: {
          RecipeDetail.routeName: (ctx) => RecipeDetail(),
        },
      ),
    );
  }
}
