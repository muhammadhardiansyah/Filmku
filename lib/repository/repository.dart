import 'package:filmku/model/cast_response.dart';
import 'package:filmku/model/genre_response.dart';
import 'package:filmku/model/movie_detail_response.dart';
import 'package:filmku/model/movie_response.dart';
import 'package:filmku/model/upcoming_response.dart';
import 'package:filmku/model/trending_response.dart';
import 'package:dio/dio.dart';
import 'package:filmku/model/person_response.dart';
import 'package:filmku/model/video_response.dart';

class MovieRepository {
  final String apiKey = "5d968bf84ae0efa980b2f800e7b67d3c";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getTopRatedUrl = '$mainUrl/movie/top_rated';
  var getTrendingUrl = '$mainUrl/movie/popular';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPersonsUrl = "$mainUrl/trending/person/week";
  var getUpcomingUrl = "$mainUrl/movie/upcoming";
  var movieUrl = "$mainUrl/movie";


  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1
    };
    try {
      Response response = await _dio.get(getTopRatedUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<TrendingResponse> getTrending() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1
    };
    try {
      Response response = await _dio.get(getTrendingUrl, queryParameters: params);
      return TrendingResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TrendingResponse.withError("$error");
    }
  }

  Future<UpcomingResponse> getUpcoming() async {
    var now_ = DateTime.now();
    var now  = now_.toString().substring(0,10); 
    var params = {
      "api_key": apiKey, 
      "language": "en-US", 
      "page": 1, 
      "primary_release_date.gte": now,
      };
    // var params = {
    //   "api_key": apiKey,
    //   "language": "en-US",
    //   "page": 7
    // };
    try {
      Response response = await _dio.get(getUpcomingUrl, queryParameters: params);
      return UpcomingResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UpcomingResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response = await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1, "with_genres": id};
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US"
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US"
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos", queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US"
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar", queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US"
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits", queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }
}
