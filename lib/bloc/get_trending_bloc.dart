import 'package:filmku/model/trending_response.dart';
import 'package:filmku/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class TrendingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TrendingResponse> _subject =
      BehaviorSubject<TrendingResponse>();

  getTrending() async {
    TrendingResponse response = await _repository.getTrending();
    _subject.sink.add(response);
  }

  dispse() {
    _subject.close();
  }

  BehaviorSubject<TrendingResponse> get subject => _subject;
  
}
final trendingBloc = TrendingListBloc();