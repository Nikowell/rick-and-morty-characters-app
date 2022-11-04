part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded(this.characters);
}

class CharacterSorted extends CharacterState {
  final List<Character> characters;

  CharacterSorted(this.characters);
}
