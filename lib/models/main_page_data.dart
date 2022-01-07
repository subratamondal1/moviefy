// Models
import 'package:moviefy/models/movie.dart';
import 'package:moviefy/models/search_category.dart';

// This class MainPageData models the data that we require for our MainPage UI. It has a constructor and another
// constructor called the MainPageData.initialState() which kind of provides the default state of the class that
// the class should be in.
// We also have a Helper Function i.e MainPageData copyWith() that takes in some parameters and whatever arguments
// are provided it returns us a new instance of the MainPageData class with the new data that was provided for whatever
// attribute that we have inside the class. And if for any attribute we do not get any data provided to us then it just
// maintains the previous state of that attribute

class MainPageData {
  final List<Movie> movies;
  // Pagination is the way of giving data in chunks by the API instead of giving it in Millions.
  final int pagination;
  final String searchCategory;
  final String searchText;

  MainPageData(
      {required this.movies,
      required this.pagination,
      required this.searchCategory,
      required this.searchText});
  //This named constructor gives us to create a construtor with basic data inside of it.
  //Therefore, this will be the Initial state of our mainpage
  MainPageData.initialState()
      : movies = [],
        pagination = 1,
        searchCategory = SearchCategory.popular,
        searchText = "";

  //VVIP : Helper Function : This function is a way for us to actually take some data and change it
  //        in the class without changing other data so that we can maintain the state of the class and
  //        just change the data that we require
  MainPageData copyWith({
    List<Movie>? movies,
    int? pagination,
    String? searchCategory,
    String? searchText,
  }) {
    return MainPageData(
        movies: movies ?? this.movies,
        pagination: pagination ?? this.pagination,
        searchCategory: searchCategory ?? this.searchCategory,
        searchText: searchText ?? this.searchText);
  }
  // movies: movies ?? this.movies, means if I get the new movies then i am going
  //to return those  new movies to movies else i am going to return this.movies and maintain the Previous State
}
