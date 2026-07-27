import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/Presentation_layer/screens/CharactersDetailsScreen.dart';
import 'package:learn_bloc/Presentation_layer/screens/characters_screen.dart';
import 'package:learn_bloc/business_logic/cubit/character_cubit.dart';
import 'package:learn_bloc/constants/strings.dart';
import 'package:learn_bloc/data/repository/characters_repository.dart';
import 'package:learn_bloc/data/web_services/characters_web_services.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices(),);
    characterCubit = CharacterCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharacterCubit(charactersRepository),
            child: CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => CharactersDetailsScreen(),
        );
    }

    return null;
  }
}