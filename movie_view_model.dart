import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/models/actor/actor.dart';
import 'package:movieapp/core/models/genre/genre.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../core/repositories/movies_repository/movies_repository.dart';
import '../../../locator.dart';

class MovieViewModel extends BaseViewModel {
  BuildContext? context;
  Movie? movie;
  Genre? genre;

  Future<void> init(BuildContext context, Movie movie) async {
    this.context = context;

    setBusy(true);

    this.movie = await locator<MoviesRepository>()
        .fetchMovie({'id': movie.id.toString(), 'lang': 'en'});

    /* this.genre = await locator<MoviesRepository>()
        .fetchGenre({'id': movie.id.toString(), 'lang': 'en'});*/

    setBusy(false);
  }
}
