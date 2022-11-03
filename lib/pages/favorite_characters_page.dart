import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters_app/blocs/favorite_character/favorite_character_bloc.dart';

import '../models/character.dart';
import '../widgets/character_card.dart';

class FavoriteCharactersPage extends StatefulWidget {
  const FavoriteCharactersPage({Key? key}) : super(key: key);

  @override
  _FavoriteCharactersPageState createState() => _FavoriteCharactersPageState();
}

class _FavoriteCharactersPageState extends State<FavoriteCharactersPage> {
  @override
  Widget build(BuildContext context) {
    context.read<FavoriteCharacterBloc>().add(LoadFavoriteCharacters());

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
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
          ),
          Expanded(
            child: BlocBuilder<FavoriteCharacterBloc, FavoriteCharacterState>(
              bloc: context.read<FavoriteCharacterBloc>(),
                builder: (context, state) {
                  if (state is FavoriteCharactersLoaded) {
                    List<Character> characters = state.characters;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final character = characters.elementAt(index);
                        return CharacterCard(character: character);
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
