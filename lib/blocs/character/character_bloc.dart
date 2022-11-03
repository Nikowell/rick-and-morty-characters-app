import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_characters_app/services/rick_and_morty_service.dart';

import '../../dao/character_dao.dart';
import '../../models/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterDao favoriteCharacterDao;
  List<Character> characters = [];
  RickAndMortyService rickAndMortyService = RickAndMortyService();

  CharacterBloc(this.favoriteCharacterDao) : super(CharacterInitial()) {

    on<LoadCharacters>((event, emit) async {
      characters = await rickAndMortyService.getAllCharacters();
      emit(CharacterLoaded(characters));
    });

    on<UpdateFavoriteStatus>((event, emit) async {
      event.character.isFavorite = !event.character.isFavorite;
      if (event.character.isFavorite) {
        await favoriteCharacterDao.insertFavoriteCharacter(event.character);
      } else {
        await favoriteCharacterDao.deleteFavoriteCharacter(event.character.id);
      }
      characters[characters.indexWhere((element) => element.id == event.character.id)] = event.character;
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
