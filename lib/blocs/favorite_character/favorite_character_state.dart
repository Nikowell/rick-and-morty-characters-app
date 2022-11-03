part of 'favorite_character_bloc.dart';

@immutable
abstract class FavoriteCharacterState {}

class FavoriteCharacterInitial extends FavoriteCharacterState {}

class FavoriteCharactersLoaded extends FavoriteCharacterState {
  final List<Character> characters;

  FavoriteCharactersLoaded(this.characters);
}