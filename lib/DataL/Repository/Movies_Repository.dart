import 'package:dartz/dartz.dart';
import 'package:moviesapp/Cores/Error/Failure.dart';
import 'package:moviesapp/Cores/exceptions/exseption.dart';
import 'package:moviesapp/DataL/DataSource/Remote_Movie_Data.dart';
import 'package:moviesapp/DomainL/Entities/movie_Entity.dart';
import 'package:moviesapp/DomainL/baseRepository/base_Movie_Repo.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseRemoteMovieData baseRemoteMovieData;

  MoviesRepository(this.baseRemoteMovieData);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovie() async {
    var result = await baseRemoteMovieData.getNowPlayingMovie();
    try {
      return Right(result); //as List<Movies>
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    var result = await baseRemoteMovieData.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    var result = await baseRemoteMovieData.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
