// Packages
import 'package:get_it/get_it.dart';

// Models
import 'package:moviefy/models/app_config.dart';

// This movie class is an example of ENCAPSULATION where the class keeps the data and the function as an unit
// This movie class is going to Encapsulate all of the data for each of the movie results that we are going to be pulling from the server
class Movie {
  final String name;
  final String language;
  final String description;
  final String posterPath;
  final String backDropPath;
  final String releaseDate;

  final bool isAdult;
  final num rating;

  Movie({
    required this.name,
    required this.language,
    required this.description,
    required this.posterPath,
    required this.backDropPath,
    required this.releaseDate,
    required this.isAdult,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json["title"],
      language: _json["original_language"],
      description: _json["overview"],
      posterPath: _json["poster_path"],
      backDropPath: _json["backdrop_path"],
      releaseDate: _json["release_date"],
      isAdult: _json["adult"],
      rating: _json["vote_average"],
    );
  }

  String posterURL() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();

    return "${_appConfig.BASE_IMAGE_API_URL}${this.posterPath}";
  }
}
