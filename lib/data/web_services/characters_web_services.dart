import 'package:dio/dio.dart';
import 'package:learn_bloc/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    Response response = await dio.get('characters');
    print(response.data.toString());
    return response.data;
  }
}