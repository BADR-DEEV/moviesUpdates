import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/models/movie/movie.dart';
import '../../widgets/screens_widgets/actors_image_slide.dart';
import '../../widgets/screens_widgets/movies_image_slide.dart';
import '../../widgets/screens_widgets/users_review.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '../favorite/favorites_movies_view.dart';
import 'movie_view_model.dart';

// ignore: must_be_immutable
class MovieView extends StatefulWidget {
  Movie movie;
  MovieView(this.movie);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView>
    with SingleTickerProviderStateMixin {
  List favoriteDataList = [];
  double? _ratingValue;
  TextEditingController rev = new TextEditingController();
  @override
  void didUpdateWidget(MovieView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  TextEditingController? commentController;
  FocusNode? commentFocusNode;

  @override
  void initState() {
    super.initState();

    commentController = TextEditingController();

    commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    commentController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  var box = Hive.box<LikedModel>('liked');
    return ViewModelBuilder<MovieViewModel>.reactive(
      viewModelBuilder: () => MovieViewModel(),
      onModelReady: (model) async {
        await model.init(context, widget.movie);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(body: LoadingCircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 100,
                  // color: Colors.transparent,
                  alignment: Alignment.centerRight,
                  child: Expanded(
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                0, 0, 0, 0), // background (button) color
                            foregroundColor: Color.fromARGB(
                                0, 255, 255, 255), // foreground (text) color
                          ),
                          onPressed: () {
                            FavoritesMoviesView();
                          },
                          child: Icon(
                            Icons.favorite,
                            color: Color(0xFFF4D35E),
                            size: 50,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserReview(
                                        rev: rev.text,
                                      )),
                            );
                          }),
                          child: Text(
                            "reviws",
                            style: TextStyle(
                              height: 1,
                              color: Colors.white,
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: model.isBusy
                  ? LoadingCircularProgressIndicator()
                  : Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: CachedNetworkImage(
                              height: MediaQuery.of(context).size.height / 1.8,
                              width: double.infinity,
                              alignment: Alignment.center,
                              fit: BoxFit.fill,
                              imageUrl: model.movie!.img!,
                              placeholder: (context, url) => Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(bottom: 200),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )),
                              errorWidget: (context, url, error) => Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(bottom: 170),
                                child: Center(child: Icon(Icons.error)),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, position) {
                                return Container(
                                  height: 600,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(0)),
                                  ),
                                  child: detailsMovie(model.movie!),
                                );
                              }),
                        ),
                        Expanded(
                          flex: 0,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 0),
                              ),
                              SingleChildScrollView(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: TextFormField(
                                          controller: rev,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                          decoration: InputDecoration(
                                            hintText: "write your opinion!",
                                            hintStyle:
                                                TextStyle(color: Colors.black),
                                            filled: true,

                                            //fillColor: Color(0xff161d27).withOpacity(0.9),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                    color: Colors.amber)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                    color: Colors.amber)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: RatingBar(
                                          itemSize: 25,
                                          initialRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          ratingWidget: RatingWidget(
                                              full: const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 5,
                                              ),
                                              half: const Icon(
                                                Icons.star_half,
                                                color: Colors.amber,
                                                size: 5,
                                              ),
                                              empty: const Icon(
                                                Icons.star_outline,
                                                color: Colors.amber,
                                                size: 5,
                                              )),
                                          onRatingUpdate: (value) {
                                            setState(() {
                                              _ratingValue = value;
                                            });
                                          }),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserReview(
                                                      rev: rev.text,
                                                    )),
                                          );
                                        },
                                        child: Text("send"))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
    );
  }
}

Widget detailsMovie(Movie movie) {
  return Container(
    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
    child: Column(children: [
      Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              movie.title!,
              style: TextStyle(
                color: Color(0xFF2E2F5B),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "(${movie?.release_date != null ? movie.release_date!.substring(0, 4) : "Unknown"})",
                style: TextStyle(
                  color: Color(0xFF2E2F5B),
                  fontSize: 10,
                  //fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),

      Row(children: [
        Row(
          children: [
            RatingBar.builder(
              itemSize: 15,
              initialRating: Random().nextInt(5).toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: AppColors.app_color_on_primary,
              ),
              onRatingUpdate: (rating) {
                Text(movie.rating!);
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 190),
              child: Text(
                movie.running_time!.hours.toString() +
                    ": " +
                    movie.running_time!.minutes.toString() +
                    ':00 ',
                style: TextStyle(
                    color: AppColors.app_color_primary,
                    fontSize: 10,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ]),
      SizedBox(
        height: 10,
      ),

      Text(
        movie.description!,
        style: TextStyle(
          height: 1.9,
          color: Color(0xFF2E2F5B),
          fontSize: 13,
        ),
      ),
      SizedBox(
        height: 15,
      ),

      /*SizedBox(
        height: 15,
      ),*/
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Cast',
          style: TextStyle(
            color: Color(0xFF2E2F5B),
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Expanded(
        child: ActorsImageSlider(),
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Related Movies',
          style: TextStyle(
            color: Color(0xFF2E2F5B),
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Expanded(
        child: MoviesImageSlider(),
      )

      //,
    ]),
  );
}
