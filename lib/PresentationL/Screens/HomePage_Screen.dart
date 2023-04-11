import 'package:flutter/material.dart';
import 'package:moviesapp/Cores/Utiles/enum.dart';
import 'package:moviesapp/DataL/Models/movies_Model.dart';
import 'package:moviesapp/PresentationL/Screens/Moviesdetails.dart';
import 'package:moviesapp/PresentationL/Screens/See_More.dart';
import 'package:moviesapp/PresentationL/provider/Home_Provider.dart';
import 'package:provider/provider.dart';

import '../../Cores/Utiles/App_Constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<HomeProvider>(context, listen: false)
          .getNowPlayingMovies();
      await Provider.of<HomeProvider>(context, listen: false)
          .getTopRatedMovies();
      await Provider.of<HomeProvider>(context, listen: false)
          .getPopularMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
            child: Consumer<HomeProvider>(builder: (context, provider, child) {
          return provider.getNowPlayingState != RequestState.isLoaded ||
                  provider.getPopularState != RequestState.isLoaded ||
                  provider.getTopRatedState != RequestState.isLoaded
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.grey[700],
                ))
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(
                      height: 350,
                      child: PageView.builder(itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 7),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  opacity: 50,
                                  image: NetworkImage(
                                      AppConstants.basePosterUrl +
                                          provider.nowPlayingListMovies![index]
                                              .posterPath))),
                          child: Column(
                            children: [
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 6,
                                    backgroundColor: Colors.red,
                                  ),
                                  Text(
                                    "Now Playing Movies",
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                provider.nowPlayingListMovies![index].title,
                                style: const TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Popular",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        SeeMoreMovies(title: "Popular")));
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "See More",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.popularMoviesList!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MoviesDetailes(
                                        moviesModel: MoviesModel(
                                            genreIds: provider
                                                .popularMoviesList![index]
                                                .genreIds,
                                            id: provider
                                                .popularMoviesList![index].id,
                                            overview: provider
                                                .popularMoviesList![index]
                                                .overview,
                                            posterPath: provider
                                                .popularMoviesList![index]
                                                .posterPath,
                                            releaseData: provider
                                                .popularMoviesList![index]
                                                .releaseData,
                                            title: provider
                                                .popularMoviesList![index]
                                                .title,
                                            voteAvg: provider
                                                .popularMoviesList![index]
                                                .voteAvg))));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      padding:
                                          EdgeInsets.only(left: 4, bottom: 4),
                                      width: 150,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(AppConstants
                                                      .basePosterUrl +
                                                  provider
                                                      .popularMoviesList![index]
                                                      .posterPath))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: Text(
                                        provider
                                            .popularMoviesList![index].title,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Movie",
                                          style: TextStyle(
                                              color: Colors.yellow[800],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "${provider.popularMoviesList![index].releaseData}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Top Rated",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        SeeMoreMovies(title: "Top Rated")));
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "See More",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.topRatedMoviesList!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MoviesDetailes(
                                        moviesModel: MoviesModel(
                                            genreIds: provider
                                                .topRatedMoviesList![index]
                                                .genreIds,
                                            id: provider
                                                .topRatedMoviesList![index].id,
                                            overview: provider
                                                .topRatedMoviesList![index]
                                                .overview,
                                            posterPath: provider
                                                .topRatedMoviesList![index]
                                                .posterPath,
                                            releaseData: provider
                                                .topRatedMoviesList![index]
                                                .releaseData,
                                            title: provider
                                                .topRatedMoviesList![index]
                                                .title,
                                            voteAvg: provider
                                                .topRatedMoviesList![index]
                                                .voteAvg))));
                              },
                              child: Container(
                                width: 150,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstants.basePosterUrl +
                                                provider
                                                    .topRatedMoviesList![index]
                                                    .posterPath))),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    )
                  ],
                );
        })));
  }
}
