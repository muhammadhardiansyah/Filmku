import 'movie.dart';

class UpcomingResponse {
  final List<Movie> upcoming;
  final String error;

  UpcomingResponse(this.upcoming, this.error);

  UpcomingResponse.fromJson(Map<String, dynamic> json)
      : upcoming = (json["results"] as List)
            .map((i) => new Movie.fromJson(i))
            .toList(),
        error = "";

  UpcomingResponse.withError(String errorValue)
      : upcoming = [],
        error = errorValue;
}
