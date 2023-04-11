import 'package:get_it/get_it.dart';
import 'package:moviesapp/DataL/DataSource/Remote_Movie_Data.dart';
import 'package:moviesapp/DataL/Repository/Movies_Repository.dart';
import 'package:moviesapp/DomainL/baseRepository/base_Movie_Repo.dart';
import 'package:moviesapp/DomainL/useCases/get_Top_Rated_Movies_useCase.dart';
import 'package:moviesapp/DomainL/useCases/now_playing_use_Case.dart';
import 'package:moviesapp/DomainL/useCases/popular_Movie_useCase.dart';

// get_It instance
final sl = GetIt.instance;

class ServerLocator {
  void init() {
    //useCase
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => popularMovieUseCase(sl()));
    sl.registerLazySingleton(() => TopRatedUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));
    //Data Source
    sl.registerLazySingleton<BaseRemoteMovieData>(() => RemoteMoviesData());
  }
}
