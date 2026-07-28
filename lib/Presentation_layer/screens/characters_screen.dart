import 'package:flutter/material.dart';

class CharactersScreen extends StatefulWidget {
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
      appBar: AppBar(
        backgroundColor:MyColors.myYellow,
        title: Text('Characters',style: TextStyle(
          color: MyColors.myGray,
        ),),
      ),
      body: Container(
        child: Text("State 200"),
      ),
    );
  }
}
