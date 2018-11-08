import 'dart:async';

import 'package:test_app/common/session_manager_data.dart';


class SessionManagerBloc {
 
//sink Controller
  final _inStreamController = StreamController<SessionManagerData>();

  Sink<SessionManagerData> get updateSession => _inStreamController.sink;

  final _outStreamController = StreamController<SessionManagerData>();
  Stream<SessionManagerData> get sessionInfo => _outStreamController.stream;

  SessionManagerBloc(){
    //In Constructor add listner method
    _inStreamController.stream.listen(onUpdateSessionData);

  }

//onDataChange method willbe called from listner 
  void onUpdateSessionData(SessionManagerData inputData){
    print('Session Manager Initialized');
    final sessionManger = SessionManagerData();
    sessionManger.sessionId = 'ABCDEFH12345546565656565';
    sessionManger.userName = 'RAM PAL';

    _outStreamController.add(sessionManger);
  
  }
  void dispose(){
    _inStreamController.close();
    _outStreamController.close();
  }

}