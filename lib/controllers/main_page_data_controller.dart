import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:moviefy/models/main_page_data.dart';
import 'package:moviefy/models/movie.dart';
import 'package:moviefy/models/search_category.dart';
import 'package:moviefy/services/movie_service.dart';

// This is a CONTROLLER that will be Responisble for actually providing the data to our class and maintaining states for our
// class as well as providing functions that our UI can interact with to actually call upon change in the UI.
class MainPageDataController extends StateNotifier<MainPageData> {
  // super(state ?? MainPageData.initialState()) => If new state i,e 'state' is not given to us then we are going to use the default state ,
  // and we get the default state from THE MainPageData.initialState()
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.initialState()) {
    getMovies();
  }
  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie> _movies = [];

      if (state.searchText.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          _movies =
              await _movieService.getPopularMovies(page: state.pagination);
        } else if (state.searchCategory == SearchCategory.upcoming) {
          _movies =
              await _movieService.getUpcomingMovies(page: state.pagination);
        } else if (state.searchCategory == SearchCategory.none) {
          _movies = [];
        }
      } else {
        _movies = await _movieService.searchMovies(state.searchText);
      }

      // The below 'state' is responsible for what is shown on the screen
      state = state.copyWith(
          movies: [...state.movies, ..._movies],
          pagination: state.pagination + 1);
    } catch (e) {
      print(e);
    }
  }

  void updateSearchCategory(String _category) {
    try {
      state = state.copyWith(
          movies: [],
          pagination: 1,
          searchCategory: _category,
          searchText:
              ''); //The  movies: [] is empty because we are doing a new search
      getMovies();
    } catch (e) {
      print(e);
    }
  }

  void updateTextSearch(String _searchText) {
    try {
      state = state.copyWith(
        movies: [],
        pagination: 1,
        searchCategory: SearchCategory.none,
        searchText: _searchText,
      ); //The  movies: [] is empty because we are doing a new search
      getMovies();
    } catch (e) {
      print(e);
    }
  }
}
