part of 'favorite_character_bloc.dart';

@immutable
abstract class FavoriteCharacterEvent {}

class LoadFavoriteCharacters extends FavoriteCharacterEvent {}

class InsertNewFavoriteCharacter extends FavoriteCharacterEvent {
  final Character favoriteCharacter;

  InsertNewFavoriteCharacter(this.favoriteCharacter);
}

class RemoveFavoriteCharacter extends FavoriteCharacterEvent {
  final int id;

  RemoveFavoriteCharacter(this.id);
}
