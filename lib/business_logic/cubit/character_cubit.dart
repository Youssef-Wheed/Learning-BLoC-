import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/models/character.dart';
import 'package:learn_bloc/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
  late List<Character> characters;
  CharacterCubit(this.charactersRepository) : super(CharacterInitial());
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;



  }
}
