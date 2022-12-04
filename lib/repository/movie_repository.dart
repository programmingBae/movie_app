import 'dart:convert';

import 'package:dio/dio.dart';

import '../entities/movie.dart';
import '../entities/tresult.dart';

class MovieRepository {
  Dio _dio;
  MovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<Movie>> getMovies(String page) async {
    try {
      String api =
          "https://api.themoviedb.org/3/movie/now_playing?api_key=e8fe9f9fff4de0d37b0e69fa6df8cd5c&language=en-US&page=1";
      var response = await _dio.get(api);

      // return TResult.success(Person.fromJson(personJson));
      return (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
    } on DioError catch (e) {
      print(e.response);
      return jsonDecode(e.response!.toString())['message'];
    }
  }
}
