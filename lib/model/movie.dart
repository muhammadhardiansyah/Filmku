class Movie {
  final int id;
  final num popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final num rating;
  final String release_date;

  Movie(this.id,
         this.popularity,
         this.title,
         this.backPoster,
         this.poster,
         this.overview,
         this.release_date,
         this.rating);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        release_date = json["release_date"],
        rating = json["vote_average"].toDouble();
}
