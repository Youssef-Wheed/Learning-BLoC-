import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/models/character.dart';
import 'package:learn_bloc/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  void getAllCharacters() {
    emit(CharactersLoading());
    charactersRepository.getAllCharacters().then((characters) {
      this.characters = characters;
      emit(CharactersLoaded(characters));
    }).catchError((error) {
      print('REAL ERROR: $error');
      emit(CharactersError(error.toString()));
    });
  }
}