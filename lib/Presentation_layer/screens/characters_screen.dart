import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
 late List<Character> allCharacters;
  @override

  void initState(){
    super.initState();
    allCharacters = BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("State 200"),
      ),
    );
  }
}
