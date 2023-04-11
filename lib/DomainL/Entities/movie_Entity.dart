// id: 677179,
// original_language: "en",
// original_title: "Creed III",
// overview: "After dominating the boxing world, Adonis Creed has been thriving in both his career and family life. When a childhood friend and former boxing prodigy, Damien Anderson, resurfaces after serving a long sentence in prison, he is eager to prove that he deserves his shot in the ring. The face-off between former friends is more than just a fight. To settle the score, Adonis must put his future on the line to battle Damien — a fighter who has nothing to lose.",
// popularity: 8271.082,
// poster_path: "/cvsXj3I9Q2iyyIo95AecSd1tad7.jpg",
// release_date: "2023-03-01",
// title: "Creed III",
// video: false,
// vote_average: 7.3,
// vote_count: 727
import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String overview;
  final String posterPath;
  final String title;
  final double voteAvg;
  final String releaseData;
  final List<int> genreIds;

  const Movies(
      {required this.id,
      required this.overview,
      required this.posterPath,
      required this.title,
      required this.voteAvg,
      required this.releaseData,
      required this.genreIds});

  @override
  List<Object?> get props =>
      [id, overview, posterPath, title, voteAvg, releaseData];
}
