part of 'favorite_character_bloc.dart';

@immutable
abstract class FavoriteCharacterEvent {}

class InsertNewFavoriteCharacter extends FavoriteCharacterEvent {
  final FavoriteCharacter favoriteCharacter;

  InsertNewFavoriteCharacter(this.favoriteCharacter);
}
