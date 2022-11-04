import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters_app/blocs/character/character_bloc.dart';
import 'package:rick_and_morty_characters_app/blocs/favorite_character/favorite_character_bloc.dart';
import 'package:rick_and_morty_characters_app/widgets/status_indicator.dart';

import '../models/character.dart';

class CharacterCard extends StatefulWidget {
  final bool isRemovable;
  final Character character;

  const CharacterCard({Key? key, required this.character, required this.isRemovable}) : super(key: key);

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
              child: SizedBox(
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                  ),
                  child: Image.network(
                    widget.character.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Tooltip(
                            message: widget.character.name,
                            child: Text(
                              widget.character.name,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                overflow: TextOverflow.fade
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(widget.character.isFavorite ? Icons.star : Icons.star_border),
                          onPressed: () {
                            if (widget.isRemovable) {
                              context.read<FavoriteCharacterBloc>().add(
                                RemoveFavoriteCharacter(widget.character.id)
                              );
                            } else {
                              context.read<CharacterBloc>().add(UpdateFavoriteStatus(widget.character));
                            }
                          },
                          iconSize: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              StatusIndicator(characterStatus: widget.character.status),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "${widget.character.status} - ${widget.character.species}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Gender: ${widget.character.gender}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (widget.character.origin != null)
                            Text(
                              "Origin: ${widget.character.origin}",
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.clip,
                              ),
                            )
                        ],
                      ),
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
