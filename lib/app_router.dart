import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_bloc/Presentation_layer/screens/CharactersDetailsScreen.dart';
import 'package:learn_bloc/Presentation_layer/screens/characters_screen.dart';
import 'constants/strings.dart';

class AppRouter {
  Route? generateRoute (RouteSettings setting){
    switch (setting.name)
    {
      case characterScreen:
        return MaterialPageRoute(builder: (_) => CharactersScreen());

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
    }
  }
}