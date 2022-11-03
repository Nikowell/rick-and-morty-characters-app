import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters_app/services/rick_and_morty_service.dart';

import '../models/character.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  _CharactersListPageState createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  late RickAndMortyService _rickAndMortyService;

  @override
  void initState() {
    _rickAndMortyService = RickAndMortyService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Stack(
              children: const [
                Center(
                  child: Text(
                    'Rick & Morty',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.sort,
                      size: 35,
                      color: Colors.grey,
                    ),
                    onPressed: null,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Character>>(
              future: _rickAndMortyService.getAllCharacters(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  List<Character> characters = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final character = characters.elementAt(index);
                      return Text(character.name, style: const TextStyle(color: Colors.white));
                    },
                    itemCount: characters.length,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            ),
          )
        ],
      )
    );
  }
}
