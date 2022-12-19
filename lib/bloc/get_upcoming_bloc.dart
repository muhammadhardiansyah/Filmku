import 'package:filmku/model/upcoming_response.dart';
import 'package:filmku/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class UpcomingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<UpcomingResponse> _subject =
      BehaviorSubject<UpcomingResponse>();

  getUpcoming() async {
    UpcomingResponse response = await _repository.getUpcoming();
    _subject.sink.add(response);
  }

  dispse() {
    _subject.close();
  }

  BehaviorSubject<UpcomingResponse> get subject => _subject;
  
}
final upcomingBloc = UpcomingListBloc();