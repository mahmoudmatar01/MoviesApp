import 'dart:convert';
import 'package:moviesapp/Cores/Utiles/App_Constants.dart';
import 'package:moviesapp/Cores/exceptions/exseption.dart';
import 'package:moviesapp/Cores/network/erroe_message_model.dart';
import 'package:moviesapp/DataL/Models/movies_Model.dart';
import 'package:http/http.dart' as https;

abstract class BaseRemoteMovieData {
  Future<List<MoviesModel>> getNowPlayingMovie();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}

class RemoteMoviesData implements BaseRemoteMovieData {
  @override
  Future<List<MoviesModel>> getNowPlayingMovie() async {
    List<MoviesModel> nowPlayingMoviesList = [];
    final https.Response response =
        await https.get(Uri.parse(AppConstants.nowPlayingPath));
    final responseData = jsonDecode(response.body)["results"];
    if (response.statusCode == 200) {
      nowPlayingMoviesList = List<MoviesModel>.from(
          (responseData as List).map((e) => MoviesModel.fromjson(e)));
      return nowPlayingMoviesList;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(responseData));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    List<MoviesModel> popularMoviesList = [];
    final https.Response response =
        await https.get(Uri.parse(AppConstants.popularMoviePath));
    final responseData = jsonDecode(response.body)["results"];
    if (response.statusCode == 200) {
      popularMoviesList = List<MoviesModel>.from(
          (responseData as List).map((e) => MoviesModel.fromjson(e)));
      return popularMoviesList;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(responseData));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    List<MoviesModel> topRatedMoviesList = [];
    final https.Response response =
        await https.get(Uri.parse(AppConstants.topRatedPath));
    final responseData = jsonDecode(response.body)["results"];
    if (response.statusCode == 200) {
      topRatedMoviesList = List<MoviesModel>.from(
          (responseData as List).map((e) => MoviesModel.fromjson(e)));
      return topRatedMoviesList;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(responseData));
    }
  }
}
