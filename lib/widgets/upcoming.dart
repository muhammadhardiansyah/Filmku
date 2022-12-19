
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:filmku/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:filmku/bloc/get_upcoming_bloc.dart';
import 'package:filmku/model/upcoming.dart';
import 'package:filmku/model/upcoming_response.dart';
import 'package:filmku/style/theme.dart' as Style;
import 'package:filmku/screens/detail_screen.dart';

class UpComing extends StatefulWidget {
  @override
  _UpComingState createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  @override
  void initState() {
    super.initState();
    upcomingBloc..getUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "UPCOMING MOVIES",
            style: TextStyle(
                color: Style.Colors.titleColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<UpcomingResponse>(
          stream: upcomingBloc.subject.stream,
          builder: (context, AsyncSnapshot<UpcomingResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return _buildErrorWidget(snapshot.data.error);
              }
              return _buildHomeWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildHomeWidget(UpcomingResponse data) {
    // List<Upcoming> cek_upcoming = data.upcoming;
    // var now_ = DateTime.now();
    // var strNow = now_.toString();
    // DateTime now = DateTime.parse(strNow);
    //var release = cek_upcoming[index].release_date.toString();
    List<Movie> movies = data.upcoming;
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        height: 270.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailScreen(movie: movies[index]),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: movies[index].id,
                      child: Container(
                          width: 120.0,
                          height: 180.0,
                          decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w200/" +
                                        movies[index].poster)),
                          )),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        movies[index].title,
                        maxLines: 2,
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          movies[index].release_date.toString(),
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        // RatingBar(
                        //   ratingWidget: RatingWidget(
                        //     empty: Icon(
                        //       EvaIcons.star,
                        //       color: Style.Colors.secondColor,
                        //     ),
                        //     full: Icon(
                        //       EvaIcons.star,
                        //       color: Style.Colors.secondColor,
                        //     ),
                        //     half: Icon(
                        //       EvaIcons.star,
                        //       color: Style.Colors.secondColor,
                        //     ),
                        //   ),
                        //   itemSize: 8.0,
                        //   initialRating: 0 / 2,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
