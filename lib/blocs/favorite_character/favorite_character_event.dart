part of 'favorite_character_bloc.dart';

@immutable
abstract class FavoriteCharacterEvent {}

class LoadFavoriteCharacters extends FavoriteCharacterEvent {}

class RemoveFavoriteCharacter extends FavoriteCharacterEvent {
  final int id;

  RemoveFavoriteCharacter(this.id);
}
