import 'package:moviesapp/DomainL/Entities/movie_Entity.dart';

class MoviesModel extends Movies {
  const MoviesModel(
      {required super.id,
      required super.overview,
      required super.posterPath,
      required super.title,
      required super.voteAvg,
      required super.genreIds,
      required super.releaseData});

  //method fromjson
  factory MoviesModel.fromjson(Map<String, dynamic> json) => MoviesModel(
      id: json["id"],
      overview: json["overview"],
      posterPath: json["backdrop_path"] ?? "",
      title: json["title"],
      voteAvg: json["vote_average"].toDouble(),
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      releaseData: json["release_date"]);
}
