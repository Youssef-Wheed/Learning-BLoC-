part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

class CharactersLoading extends CharacterState {}

class CharactersLoaded extends CharacterState {
  final List<Character> characters;
  CharactersLoaded(this.characters);
}

class CharactersError extends CharacterState {
  final String message;
  CharactersError(this.message);
}