import 'dart:convert';

import 'package:dio/dio.dart';

import '../entities/credit.dart';
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

  Future<List<Credit>> getCredits(int movieID) async {
    try {
      String url =
          "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=e8fe9f9fff4de0d37b0e69fa6df8cd5c";
      var response = await _dio.get(url);
      return (response.data['cast'] as List)
          .map((e) => Credit.fromJson(e))
          .toList();
    } on DioError catch (e) {
      // TODO
      print(e.response);
      return jsonDecode(e.response!.toString())['message'];
    }
  }

  Future<Movie> getMovieById(int movieID) async {
    try {
      String url =
          "https://api.themoviedb.org/3/movie/$movieID?api_key=e8fe9f9fff4de0d37b0e69fa6df8cd5c&language=en-US";
      var response = await _dio.get(url);
      // return (response.data).map((e) => Movie.fromJson(e));
      return Movie.fromJson(response.data);
    } on DioError catch (e) {
      // TODO
      print(e.response);
      return jsonDecode(e.response!.toString())['message'];
    }
  }
}
