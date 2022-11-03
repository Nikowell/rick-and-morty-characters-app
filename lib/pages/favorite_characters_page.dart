import 'package:flutter/material.dart';

class FavoriteCharactersPage extends StatefulWidget {
  const FavoriteCharactersPage({Key? key}) : super(key: key);

  @override
  _FavoriteCharactersPageState createState() => _FavoriteCharactersPageState();
}

class _FavoriteCharactersPageState extends State<FavoriteCharactersPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            'Favorites',
            style: TextStyle(
              color: Colors.green,
              fontSize: 30
            ),
          ),
        ),
    ));
  }
}
