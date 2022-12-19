import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:filmku/widgets/nowplaying.dart';
import 'package:filmku/widgets/trending.dart';
import 'package:flutter/material.dart';
import 'package:filmku/style/theme.dart' as Style;
import 'package:filmku/widgets/best_movies.dart';
import 'package:filmku/widgets/genres.dart';
import 'package:filmku/widgets/now_playing.dart';
import 'package:filmku/widgets/upcoming.dart';
import 'package:filmku/widgets/persons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Colors.white,),
        title: Text("Filmku"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.searchOutline, color: Colors.white,)
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          TrendingMovies(),
          NowPlayingMovies(),
          //GenresScreen(),
          UpComing(),
          PersonsList(),
          BestMovies(),
        ],
      ),
    );
  }
}