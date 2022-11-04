import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters_app/blocs/character/character_bloc.dart';

import '../models/character.dart';
import '../widgets/character_card.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  _CharactersListPageState createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  late CharacterBloc _characterBloc;
  late ScrollController controller;
  List<Character> _characters = [];

  @override
  void initState() {
    _characterBloc = BlocProvider.of<CharacterBloc>(context);
    controller = ScrollController()..addListener(handleScrolling);
    super.initState();
  }

  void handleScrolling() {
    if (controller.offset >= controller.position.maxScrollExtent) {
      _characterBloc.add(LoadMoreCharacters());
    }
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
              children: [
                const Center(
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
                    icon: const Icon(
                      Icons.sort,
                      size: 35,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      showMenu<CharacterEvent>(
                        context: context,
                        position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
                        items: [
                          PopupMenuItem<CharacterEvent>(
                            value: SortAlphabetically(),
                            child: const Text('A => Z')),
                          PopupMenuItem<CharacterEvent>(
                            value: SortReverseAlphabetically(),
                            child: const Text('Z => A')),
                        ],
                      ).then((CharacterEvent? selectedEvent) {
                        if (selectedEvent == null) return;
                        if (selectedEvent is SortAlphabetically) {
                          _characterBloc.add(SortAlphabetically());
                        } else {
                          _characterBloc.add(SortReverseAlphabetically());
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer(
              bloc: _characterBloc,
              listener: (context, state) {
                if (state is CharacterLoading) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Loading more characters ...'),
                      duration: Duration(seconds: 1),
                    )
                  );
                }
                if (state is CharacterSorted) {
                  controller.jumpTo(controller.position.minScrollExtent);
                }
              },
              buildWhen: (previous, current) {
                return (previous != current && current is CharacterLoaded) || current is CharacterSorted;
              },
              builder: (context, state) {
                if (state is CharacterLoaded) {
                 List<Character> characters = state.characters;
                 return ListView.builder(
                   shrinkWrap: true,
                   itemBuilder: (context, index) {
                     final character = characters.elementAt(index);
                     return CharacterCard(character: character, isRemovable: false);
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
