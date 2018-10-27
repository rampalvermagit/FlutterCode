
import 'package:flutter/widgets.dart';

import './user_info_block.dart';
import './user_info_service.dart';


class UserInfoProvider extends InheritedWidget {

final  UserInfoBlock userInfoBlock;
 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static UserInfoBlock of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(UserInfoProvider) as UserInfoProvider)
          .userInfoBlock;

  UserInfoProvider({Key key, UserInfoBlock userInfoBlock, Widget child})
      : this.userInfoBlock = userInfoBlock ?? UserInfoBlock(),
        super(child: child, key: key);

}