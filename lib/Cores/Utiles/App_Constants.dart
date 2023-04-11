class AppConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "2d1f5a36c0cebcbcd78a509d7bf5553a";
  static const String nowPlayingPath =
      "${baseUrl}movie/now_playing?api_key=$apiKey";
  static const String topRatedPath =
      "${baseUrl}movie/top_rated?api_key=$apiKey";
  static const String popularMoviePath =
      "${baseUrl}movie/popular?api_key=$apiKey";

  static const String basePosterUrl = "https://image.tmdb.org/t/p/w500";
}
