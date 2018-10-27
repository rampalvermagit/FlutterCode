
import 'package:flutter/material.dart';

import 'package:test_app/BLoC/user_info.dart';
import 'package:test_app/BLoC/user_info_block.dart';
import 'package:test_app/BLoC/user_info_provider.dart';

class UserInfoSearchPage  extends StatelessWidget {
  
  @override
    Widget build(BuildContext context) {
      return UserInfoProvider(
        userInfoBlock: UserInfoBlock(),
        child:_SearchPage(),
      );
    }

}
class _SearchPage extends StatelessWidget {

 List<UserInfoData> initialValue = [];
  String _inputText ="";

  @override
  Widget build(BuildContext context) {
    final userInfoBlock = UserInfoProvider.of(context);
    return Scaffold(
            appBar: AppBar(
              title:Text('Block with Stream Controller'),
            ),
            body:Column(
              children:<Widget>[
                Container(
                  padding:EdgeInsets.all(10.0),
                  child:TextField(
                    onChanged: (text) {
                 _inputText = text;
                
                   },
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      hintText:'Enter 1, 2, 3 etc and for all just hit button',
                    ),
                  ),
                ),
                  new RaisedButton(
            
            onPressed:() {
              print("text field: $_inputText");
              userInfoBlock.searchInfo.add(_inputText);
              print('onPressed CLICKED');
             
            },
            child: Text('Fetch Data'),
          ), 
               
               Flexible(
                  child: StreamBuilder<List<UserInfoData>>(
                    stream: userInfoBlock.outStream,
                    initialData: initialValue,
                    builder:(context,AsyncSnapshot<List<UserInfoData>> snapshot){
                      if (!snapshot.hasData)
                       return Center(
                         child:CircularProgressIndicator(),
                       );

                       return ListView.builder(
                         itemCount: snapshot.data.length,
                         itemBuilder: (context,index) => ListTile(
                           title: Text(snapshot.data[index].title),
                           subtitle: Text(snapshot.data[index].msgBody),
                         ),
                       );
                    },
                  ),
                ),
              ],
            ),
        
      );
  }

}

