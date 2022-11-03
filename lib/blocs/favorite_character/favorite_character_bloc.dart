import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/favorite_character.dart';

part 'favorite_character_event.dart';
part 'favorite_character_state.dart';

class FavoriteCharacterBloc extends Bloc<FavoriteCharacterEvent, FavoriteCharacterState> {
  final FavoriteCharacterDao favoriteCharacterDao;

  FavoriteCharacterBloc(this.favoriteCharacterDao) : super(FavoriteCharacterInitial()) {
    on<InsertNewFavoriteCharacter>((event, emit) async {
      await favoriteCharacterDao.insertFavoriteCharacter(event.favoriteCharacter);
    });
  }
}
