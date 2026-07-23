part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

// data loaded
class CharactersLoaded extends CharacterState {
  final List<Character> characters ;
  CharactersLoaded(this.characters);
}