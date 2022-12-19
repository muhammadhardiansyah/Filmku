import 'movie.dart';

class TrendingResponse {
  final List<Movie> trending;
  final String error;

  TrendingResponse(this.trending, this.error);

  TrendingResponse.fromJson(Map<String, dynamic> json)
      : trending = (json["results"] as List)
            .map((i) => new Movie.fromJson(i))
            .toList(),
        error = "";

  TrendingResponse.withError(String errorValue)
      : trending = [],
        error = errorValue;
}
