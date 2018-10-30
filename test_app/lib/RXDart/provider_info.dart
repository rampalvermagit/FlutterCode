
import 'package:flutter/widgets.dart';

import 'package:test_app/RXDart/rxdart_block.dart';



class TestServiceProvider extends InheritedWidget {

final  TestBloc userInfoBlock;
 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static TestBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(TestServiceProvider) as TestServiceProvider)
          .userInfoBlock;

  TestServiceProvider({Key key, TestBloc userInfoBlock, Widget child})
      : this.userInfoBlock = userInfoBlock ?? TestBloc(),
        super(child: child, key: key);

}