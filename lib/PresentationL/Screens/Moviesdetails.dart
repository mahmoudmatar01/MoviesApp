import 'package:flutter/material.dart';
import 'package:moviesapp/Cores/Utiles/App_Constants.dart';
import 'package:moviesapp/DataL/Models/movies_Model.dart';
import 'package:moviesapp/PresentationL/provider/Home_Provider.dart';
import 'package:provider/provider.dart';

class MoviesDetailes extends StatefulWidget {
  MoviesModel moviesModel;
  MoviesDetailes({required this.moviesModel});

  @override
  State<MoviesDetailes> createState() => _MoviesDetailesState();
}

class _MoviesDetailesState extends State<MoviesDetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.basePosterUrl +
                        widget.moviesModel.posterPath))),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.moviesModel.title,
              style: const TextStyle(
                  letterSpacing: 2,
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  "${widget.moviesModel.voteAvg}",
                  style: TextStyle(color: Colors.yellow[600], fontSize: 18),
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                const Spacer(),
                Text(
                  widget.moviesModel.releaseData,
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    color: Colors.grey[50],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.moviesModel.overview,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Most Similar",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.yellow[600],
                  fontWeight: FontWeight.w800),
            ),
          ),
          Consumer<HomeProvider>(builder: (context, provider, child) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                                          .topRatedMoviesList![index].genreIds,
                                      id: provider
                                          .topRatedMoviesList![index].id,
                                      overview: provider
                                          .topRatedMoviesList![index].overview,
                                      posterPath: provider
                                          .topRatedMoviesList![index]
                                          .posterPath,
                                      releaseData: provider
                                          .topRatedMoviesList![index]
                                          .releaseData,
                                      title: provider
                                          .topRatedMoviesList![index].title,
                                      voteAvg: provider
                                          .topRatedMoviesList![index]
                                          .voteAvg))));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      AppConstants.basePosterUrl +
                                          provider.topRatedMoviesList![index]
                                              .posterPath))),
                        ),
                      );
                    }),
              ),
            );
          })
        ],
      ),
    );
  }
}
