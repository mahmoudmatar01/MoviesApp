import 'package:flutter/cupertino.dart';
import 'package:moviesapp/Cores/Utiles/enum.dart';
import 'package:moviesapp/DomainL/Entities/movie_Entity.dart';
import 'package:moviesapp/DomainL/useCases/get_Top_Rated_Movies_useCase.dart';
import 'package:moviesapp/DomainL/useCases/now_playing_use_Case.dart';
import 'package:moviesapp/DomainL/useCases/popular_Movie_useCase.dart';

import '../../Cores/services/Server_Locator.dart';

class HomeProvider extends ChangeNotifier {
  //call Use Case And Store result in List
  GetNowPlayingUseCase getNowPlayingUseCase = sl();
  TopRatedUseCase getTopRatedUseCase = sl();
  popularMovieUseCase getPopularMoviesUseCase = sl();
  List<Movies>? nowPlayingListMovies;
  List<Movies>? topRatedMoviesList;
  List<Movies>? popularMoviesList;

  //set RequestState => initial
  RequestState getNowPlayingState = RequestState.initial;
  RequestState getTopRatedState = RequestState.initial;
  RequestState getPopularState = RequestState.initial;

  //Method to get NowPlayingMovies
  Future<void> getNowPlayingMovies() async {
    getNowPlayingState = RequestState.loading;
    notifyListeners();
    final result = await getNowPlayingUseCase.excute();
    result.fold((l) {
      getNowPlayingState = RequestState.error;
      notifyListeners();
    }, (r) {
      nowPlayingListMovies = r;
      getNowPlayingState = RequestState.isLoaded;
      notifyListeners();
    });
  }

  //Method To get Top RatedMovies
  Future<void> getTopRatedMovies() async {
    getTopRatedState = RequestState.loading;
    notifyListeners();
    final result = await getTopRatedUseCase.excute();
    result.fold((l) {
      getTopRatedState = RequestState.error;
      notifyListeners();
    }, (r) {
      topRatedMoviesList = r;
      getTopRatedState = RequestState.isLoaded;
      notifyListeners();
    });
  }

  //Method To Get Popular Movies
  Future<void> getPopularMovies() async {
    getPopularState = RequestState.loading;
    notifyListeners();
    final result = await getPopularMoviesUseCase.excute();
    result.fold((l) {
      getPopularState = RequestState.error;
      notifyListeners();
    }, (r) {
      popularMoviesList = r;
      getPopularState = RequestState.isLoaded;
      notifyListeners();
    });
  }
}
