
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:test_app/BLoC/user_info.dart';
import 'package:test_app/BLoC/user_info_service.dart';


class RestServiceTestPage extends StatelessWidget {
  final String title;
  final service = UserInfoService();

  RestServiceTestPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body:FutureBuilder<List<UserInfoData>>(
        future: service.fetchData(''),
         builder: (context, data) {
          if (data.hasError) print(data.error);

          return data.hasData ? UserList(userInfo: data.data):
          Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  
}
class UserList extends StatelessWidget {
  final List<UserInfoData> userInfo;

  UserList(
    {Key key, this.userInfo}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView.builder(
          padding:EdgeInsets.symmetric(vertical: 8.0),
          itemCount: userInfo.length,
          itemBuilder: (BuildContext context, int index){
            final String titleData = userInfo[index].title;
            final String desc = userInfo[index].msgBody;
            final String userId = userInfo[index].userId.toString();
           
            return new ListTile(
              isThreeLine: true,
              leading:new CircleAvatar(child: new Text(userId)),
              title: new Text(titleData),
              subtitle: new Text(desc),
               

            );
            
          },

        ),
      );
  }

}
