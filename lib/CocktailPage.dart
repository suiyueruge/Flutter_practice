import 'package:flutter/material.dart';
import 'package:myapp/pages/homepage.dart';

const Color myColor = Colors.brown;

class CocktailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail Page",
      theme: ThemeData(
        primarySwatch: myColor,
        fontFamily: "Pacifico",
        accentColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
