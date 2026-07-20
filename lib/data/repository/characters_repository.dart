import '../models/character.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServiceses;
  CharactersRepository(this.charactersWebServiceses);

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charactersWebServiceses.getAllCharacters();
    return characters.map((characters)=> Character.fromJson(characters)).toList();
  }
}
