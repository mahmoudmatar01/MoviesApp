import 'package:flutter/material.dart';
import 'package:moviesapp/Cores/Utiles/App_Constants.dart';
import 'package:moviesapp/PresentationL/Screens/Moviesdetails.dart';
import 'package:moviesapp/PresentationL/provider/Home_Provider.dart';
import 'package:provider/provider.dart';

import '../../DataL/Models/movies_Model.dart';

class SeeMoreMovies extends StatelessWidget {
  String title;

  SeeMoreMovies({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.grey, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    );
                  },
                  itemCount: title == "Popular"
                      ? provider.popularMoviesList!.length
                      : provider.topRatedMoviesList!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.height * .15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(title == "Popular"
                                        ? AppConstants.basePosterUrl +
                                            provider.popularMoviesList![index]
                                                .posterPath
                                        : AppConstants.basePosterUrl +
                                            provider.topRatedMoviesList![index]
                                                .posterPath))),
                          ),
                          Expanded(
                            child: ListTile(
                              onTap: () {
                                title == "Popular"
                                    ? Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => MoviesDetailes(
                                            moviesModel: MoviesModel(
                                                genreIds: provider
                                                    .popularMoviesList![index]
                                                    .genreIds,
                                                id: provider
                                                    .popularMoviesList![index]
                                                    .id,
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
                                                    .voteAvg))))
                                    : Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => MoviesDetailes(
                                            moviesModel: MoviesModel(
                                                genreIds:
                                                    provider.topRatedMoviesList![index].genreIds,
                                                id: provider.topRatedMoviesList![index].id,
                                                overview: provider.topRatedMoviesList![index].overview,
                                                posterPath: provider.topRatedMoviesList![index].posterPath,
                                                releaseData: provider.topRatedMoviesList![index].releaseData,
                                                title: provider.topRatedMoviesList![index].title,
                                                voteAvg: provider.topRatedMoviesList![index].voteAvg))));
                              },
                              title: Text(
                                title == "Popular"
                                    ? provider.popularMoviesList![index].title
                                    : provider.topRatedMoviesList![index].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                title == "Popular"
                                    ? provider
                                        .popularMoviesList![index].overview
                                        .substring(0, 100)
                                    : provider
                                        .topRatedMoviesList![index].overview
                                        .substring(0, 100),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
