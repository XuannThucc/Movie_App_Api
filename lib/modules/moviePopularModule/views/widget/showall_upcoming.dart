import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/moviePopularModule/controllers/movie_upcoming_controller.dart';
import 'package:movie_app/modules/moviePopularModule/views/widget/deltail_movie_upcoming.dart';
import '/modules/moviePopularModule/controllers/movie_popular_controller.dart';
import '/modules/moviePopularModule/controllers/movie_top_rate_controller.dart';
import '/modules/moviePopularModule/views/widget/deltail_movie_top_rate.dart';
import '/modules/moviePopularModule/views/widget/movie_toprate_list_tile.dart';
import '/util/common/screen_util.dart';

import 'deltail_movie_popular.dart';
import 'movie_list_tile.dart';
class ShowAllUpcoming extends StatelessWidget {
  MovieUpcomingController _movieUpcomingController = Get.find();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Top Rate', style: TextStyle(color: Colors.redAccent),),
        ),
        body: Container(
          padding: EdgeInsets.only(left: width(20)),
          color: Colors.white,
          child: GetBuilder<MovieUpcomingController>(
            init: _movieUpcomingController,
            builder: (context) => _movieUpcomingController.isLoading
                ? CircularProgressIndicator()
                : Container(
              child: GridView.builder(
                itemBuilder: (_, index) => GestureDetector(
                  onTap:(){
                    var movieData = _movieUpcomingController.movies.results![index];
                    Get.to(DetailMovieUpcoming(), arguments: movieData.id,
                    );
                  },
                  child: MovieTopRateListTile(
                    index: index,
                  ),
                ),
                itemCount:
                _movieUpcomingController.movies.results!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: width(5),
                  mainAxisSpacing: height(20),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

