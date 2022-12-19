class Upcoming{
  final int id;
  final String title;
  final String backPoster;
  final String poster;
  final String release_date;
  final String overview;

  Upcoming(this.id,
         this.title,
         this.backPoster,
         this.poster,
         this.release_date,
         this.overview,
         );
         
  Upcoming.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        release_date = json["release_date"];
}
