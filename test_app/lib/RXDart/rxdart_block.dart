import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:test_app/BLoC/user_info.dart';
import 'package:test_app/BLoC/user_info_service.dart';

class TestBloc {
  final UserInfoService service = UserInfoService();

  Stream<List<UserInfoData>> _response = Stream.empty();
Stream<String> _reqInfo = Stream.empty();

ReplaySubject<String> _queryInfo = ReplaySubject();


  Stream<List<UserInfoData>> get response => _response;
Stream<String>  get reqInfo => _reqInfo;

Sink<String> get queryInfo => _queryInfo;

TestBloc(){
  _response = _queryInfo.distinct().asyncMap(service.fetchData).asBroadcastStream();
  _reqInfo = Observable(response)
        .withLatestFrom(_queryInfo.stream, (_, queryInfo) => 'Results for $queryInfo')
        .asBroadcastStream();
}
void dispose() {
    _queryInfo.close();
  }


}