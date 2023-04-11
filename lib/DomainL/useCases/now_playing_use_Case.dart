import 'package:dartz/dartz.dart';
import 'package:moviesapp/DomainL/Entities/movie_Entity.dart';
import 'package:moviesapp/DomainL/baseRepository/base_Movie_Repo.dart';

import '../../Cores/Error/Failure.dart';

class GetNowPlayingUseCase {
  final BaseMovieRepository baseRepo;
  GetNowPlayingUseCase(this.baseRepo);

  Future<Either<Failure, List<Movies>>> excute() async {
    return await baseRepo.getNowPlayingMovie();
  }
}
