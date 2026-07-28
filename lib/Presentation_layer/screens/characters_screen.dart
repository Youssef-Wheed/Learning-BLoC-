import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/Presentation_layer/widget/character_item.dart';
import '../../business_logic/cubit/character_cubit.dart';
import '../../constants/myColors.dart';
import '../../data/models/character.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          return buildLoadedListWidgets(state.characters);
        } else if (state is CharactersError) {
          return Center(
            child: Text(
              'حصل خطأ: ${state.message}',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(child: CircularProgressIndicator(color: MyColors.myYellow));
  }

  Widget buildLoadedListWidgets(List<Character> allCharacters) {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: Column(children: [buildCharactersList(allCharacters)]),
      ),
    );
  }

  Widget buildCharactersList(List<Character> allCharacters) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(character: allCharacters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text('Characters', style: TextStyle(color: MyColors.myGray)),
      ),
      body: buildBlocWidget(),
    );
  }
}