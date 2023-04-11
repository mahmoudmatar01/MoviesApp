import 'package:dartz/dartz.dart';
import 'package:moviesapp/DomainL/Entities/movie_Entity.dart';

import '../../Cores/Error/Failure.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovie();
  Future<Either<Failure, List<Movies>>> getTopRatedMovies();
  Future<Either<Failure, List<Movies>>> getPopularMovies();
}
