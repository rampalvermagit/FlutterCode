import 'package:flutter/widgets.dart';

import 'package:test_app/common/session_manager_bloc.dart';


class SessionManagerProvider extends InheritedWidget {

final  SessionManagerBloc sessionManagerBloc;
 //final Widget child;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
/*
SessionManagerProvider of(BuildContext context) =>
context.inheritFromWidgetOfExactType(SessionManagerProvider);
*/
static SessionManagerBloc of(BuildContext context) =>
(context.inheritFromWidgetOfExactType(SessionManagerProvider) as SessionManagerProvider).sessionManagerBloc;

  SessionManagerProvider({Key key, SessionManagerBloc sessionManagerBloc, Widget child})
      : this.sessionManagerBloc = sessionManagerBloc ?? SessionManagerBloc(),
        super(child: child, key: key);

}