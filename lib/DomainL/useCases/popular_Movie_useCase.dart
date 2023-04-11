import 'package:dartz/dartz.dart';
import 'package:moviesapp/DomainL/Entities/movie_Entity.dart';
import 'package:moviesapp/DomainL/baseRepository/base_Movie_Repo.dart';

import '../../Cores/Error/Failure.dart';

class popularMovieUseCase {
  final BaseMovieRepository baseRepo;
  popularMovieUseCase(this.baseRepo);

  Future<Either<Failure, List<Movies>>> excute() async {
    return await baseRepo.getPopularMovies();
  }
}
