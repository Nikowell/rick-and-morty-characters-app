import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../dao/character_dao.dart';
import '../../models/character.dart';

part 'favorite_character_event.dart';
part 'favorite_character_state.dart';

class FavoriteCharacterBloc extends Bloc<FavoriteCharacterEvent, FavoriteCharacterState> {
  final CharacterDao favoriteCharacterDao;

  FavoriteCharacterBloc(this.favoriteCharacterDao) : super(FavoriteCharacterInitial()) {

    on<LoadFavoriteCharacters>((event, emit) async {
      final results = await favoriteCharacterDao.findAllFavoriteCharacters();
      emit(FavoriteCharactersLoaded(results));
    });

    on<InsertNewFavoriteCharacter>((event, emit) async {
      await favoriteCharacterDao.insertFavoriteCharacter(event.favoriteCharacter);
    });
  }
}
