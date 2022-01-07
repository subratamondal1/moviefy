// Packages

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// Models
import 'package:moviefy/models/movie.dart';

class MovieTile extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;

  final double height;
  final double width;

  final Movie movie;
  MovieTile({
    Key? key,
    required this.height,
    required this.width,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _moviePosterWidget(movie.posterURL()),
            _movieInfoWidget()
          ]),
    );
  }

  Widget _moviePosterWidget(String _posterUrl) {
    return Container(
      height: height,
      width: width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: NetworkImage(_posterUrl),
        ),
      ),
    );
  }

  Widget _movieInfoWidget() {
    return Container(
      height: height,
      width: width * 0.66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.56,
                child: Text(
                  movie.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 22.0),
                ),
              ),
              Text(
                movie.rating.toString(),
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: height * 0.02),
            child: Text(
              '${movie.language.toUpperCase()} | R-Rated: ${movie.isAdult.toString().toUpperCase()} | ${movie.releaseDate}',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: height * 0.07),
            child: Text(
              movie.description,
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white70, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
