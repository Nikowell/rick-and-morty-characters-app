import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_characters_app/services/rick_and_morty_service.dart';

import '../../models/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  List<Character> characters = [];
  RickAndMortyService rickAndMortyService = RickAndMortyService();

  CharacterBloc() : super(CharacterInitial()) {

    on<LoadCharacters>((event, emit) async {
      characters = await rickAndMortyService.getAllCharacters();
      emit(CharacterLoaded(characters));
    });

    on<SortAlphabetically>((event, emit) async {
      characters.sort((a, b) => a.name.compareTo(b.name));
      emit(CharacterLoaded(characters));
    });

    on<SortReverseAlphabetically>((event, emit) async {
      characters.sort((a, b) => b.name.compareTo(a.name));
      emit(CharacterLoaded(characters));
    });
  }
}
