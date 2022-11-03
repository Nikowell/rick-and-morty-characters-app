import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters_app/blocs/favorite_character/favorite_character_bloc.dart';
import 'package:rick_and_morty_characters_app/models/favorite_character.dart';
import 'package:rick_and_morty_characters_app/widgets/status_indicator.dart';

import '../models/character.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
                Radius.circular(20)
            )
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                  ),
                  child: Image.network(
                    widget.character.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.character.name,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.star_border),
                          onPressed: () {
                            var favoriteCharacter = FavoriteCharacter(widget.character.id, widget.character.name);
                            context.read<FavoriteCharacterBloc>().add(InsertNewFavoriteCharacter(favoriteCharacter));
                          },
                          iconSize: 30,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StatusIndicator(characterStatus: widget.character.status),
                            const SizedBox(width: 8),
                            Text(
                              "${widget.character.status} - ${widget.character.species}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Gender: ${widget.character.gender}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
