import 'package:flutter/widgets.dart';

import 'package:test_app/common/session_manager_bloc.dart';
import 'package:test_app/common/session_manager_data.dart';


class SessionManagerProvider extends InheritedWidget {

//final  SessionManagerBloc sessionManagerBloc;
final SessionManagerData sessionData;
 //final Widget child;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
/*

static SessionManagerBloc of(BuildContext context) =>
(context.inheritFromWidgetOfExactType(SessionManagerProvider) as SessionManagerProvider).sessionManagerBloc;

  SessionManagerProvider({Key key, SessionManagerBloc sessionManagerBloc, Widget child})
      : this.sessionManagerBloc = sessionManagerBloc ?? SessionManagerBloc(),
        super(child: child, key: key);
*/

static SessionManagerData of(BuildContext context) =>
(context.inheritFromWidgetOfExactType(SessionManagerProvider) as SessionManagerProvider).sessionData;

  SessionManagerProvider({Key key, SessionManagerData sessionData, Widget child})
      : this.sessionData = sessionData ?? SessionManagerData(),
        super(child: child, key: key);

}